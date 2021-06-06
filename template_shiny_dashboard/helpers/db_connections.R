###############################################################################
# PURPOSE: helper script for connecting to databases
# LAST EDITED: 
###############################################################################

#### queenbee ####
env <- c("local", "production")[1] # switch index to 2 before publishing

pool_example <- dbPool(RMariaDB::MariaDB(),
      username =""
    , password = ifelse(env == "local",
        key_get(""),
        Sys.getenv(""))
    , dbname = ""
    , host = ifelse(env == "local", "127.0.0.1", 
        ""), port = 3308)

# close data connection with each session
onStop(function() {poolClose(pool_example)})

#### function: send a parameterized query ####
# inputs:
#   connection = a database connection 
#   query = string SQL query with parameter(s)
#   ... = additional parameters, e.g. 
#       1. expressions to go into glue_sql for MySQL connection
#       2. named parameters for BQ
dbParamQuery <- function(connection, query, ...) {
    
    # if it's a MySQL connection
    if (class(connection) == "MariaDBConnection") {
        glued_query <- glue_sql(
              query
            , ...
            , .con = connection
            , .envir = parent.frame(n = 9) # TO DO: refactor for easier reading
        )
        d <- dbGetQuery(connection, glued_query)
        # convert any date/time fields into UTC
        d <- d %>%
            mutate_if(is.timepoint, ~with_tz(., "UTC")) %>%
            mutate_if(is.Date, ~with_tz(., "UTC"))
        return(d)
    }
    
    # if it's a BigQuery connection
    if (class(connection) == "BigQueryConnection") {
        project <- connection@project
        dataset <- connection@dataset
        
        d <- bq_dataset_query(
              x = paste0(project, ".", dataset)
            , query = query
            , ...
            ) 
        d <- d %>% bq_table_download() %>% 
            # convert any date/time fields into UTC and clean up NAs 
            # which BigQuery logs as 1970 timepoints
            mutate_if(is.timepoint, ~with_tz(., "UTC")) %>%
            mutate_if(is.timepoint, 
                list(~if_else(. == ymd_hms('1970-01-01 00:00:00'), 
                    ymd_hms(NA), .)))
        d <- d %>% mutate_if(is.Date, ~with_tz(., "UTC"))
        return(d)
    }
}