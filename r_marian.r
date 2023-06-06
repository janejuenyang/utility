################################################################################
# load my preferred libraries, optins, and custom functions
# named for marian wright edelman, who said:
# "service is the rent we pay to be living"
# by: jane yang
################################################################################

#### set up ####
# clear environment and console
rm(list = ls())
cat("\014")

# standard libraries
library(tidyverse) # the most useful functions!
library(DBI) # database connections
library(glue) # for MySQL parameterized queries with arrays
library(bigrquery) # BigQuery-specific driver
library(rredis) # Dash has a redis cloud proxy
library(readxl) # reading Excel
library(lubridate) # making it easy to work with dates
library(keyring) # keep secrets hidden
library(scales) # for better scale labeling
library(directlabels) # for line plot labeling
library(ggfittext) # for text formatting in plots
library(cowplot) # for multi-plot manipulation
library(skimr) # for quick explorations
library(zoo) # for rolling aggregates
library(extrafont) # for prettier fonts
library(gt) # pretty table formatting
library(BRRR) # fun notifications

#### set standard options ####
theme_set(theme_minimal()) # ggplot theme
options(scipen = 20) # prefer integers over scientific notation

#### custom functions ####
# summarize counts by group and return results arranged in descending order
count_by_group <- function(data, arrange_var, ...){
    group_vars <- enquos(...)
    arrange_var <- enquo(arrange_var)
    data %>% 
        group_by(!!!group_vars) %>%
        summarize(n = n()) %>%
        ungroup() %>%
        mutate(pct = n / sum(n)) %>%
        arrange(!!arrange_var %>% desc())
}

# summarize totals by group and return results arranged in descending order
sum_by_group <- function(data, arrange_var, sum_var, ...){
    group_vars <- enquos(...)
    arrange_var <- enquo(arrange_var)
    sum_var <- enquo(sum_var)
    data %>% 
        group_by(!!!group_vars) %>%
        summarize(n = sum(!!sum_var, na.rm = TRUE)) %>%
        ungroup() %>%
        mutate(pct = n / sum(n)) %>%
        arrange(!!arrange_var %>% desc())
}

# calculate a range of percentiles given an input vector
calc_percentiles <- function(x, return_as_df = TRUE) {
    percentiles <- quantile(x, probs = c(0, 0.01, .1, .25, .50, .75, .90, .95, 
        .99, .995, .999, .9995, .9999, 1))
    mean_value <- mean(x)
    names(mean_value)  <- "Mean"
    res <- c(percentiles[1:3], mean_value, percentiles[4:length(percentiles)])
    if(return_as_df){
        res <- tibble(
              percentile = names(res)
            , value = res
        )
    }
    return(res)
}

#### functions ####
## send parameterized queries to a database
# inputs:
#   connection = a database connection 
#   query = string SQL query with parameter(s)
#   params = list of positional parameters to go into dbBind
#            for MySQL connection or named parameters for BQ
#   n.b. if using an array parameter (IN operator), function is only set up
#        to currently use one parameter named 'param_values'
dbParamQuery <- function(connection, query, ...) {
    
    # if it's a MySQL connection
    if (class(connection) == "MariaDBConnection") {
        glued_query <- glue_sql(
              query
            , ...
            , .con = connection
            , .envir = parent.frame(n = 9)
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
        
        d <- bq_dataset_query(x = paste0(project, ".", dataset),
            query, parameters = list(...)) %>%
            bq_table_download(page_size = 1e6)
        
        # convert any date/time fields into UTC and clean up NAs 
            # which BigQuery logs as 1970 timepoints
        d <- d %>% mutate_if(is.timepoint, ~with_tz(., "UTC")) %>%
                mutate_if(is.timepoint, 
                    list(~if_else(. == ymd_hms('1970-01-01 00:00:00'), 
                        ymd_hms(NA), .)))
        d <- d %>% mutate_if(is.Date, ~with_tz(., "UTC"))
        return(d)
    }
}
    