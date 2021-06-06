###############################################################################
# PURPOSE: server logic
# LAST EDITED: 
# DATA DEPENDENCIES: 
# OBJECT NAMING CONVENTIONS:
#   p_: parameter | q_: query | d_: raw dataframe | s_: graphable dataframe
#   
# REFERENCE: see helpers/sql_queries.r for details on queries and definition of
#            custom function dbParamQuery()
###############################################################################

#### load helpers ####
source("helpers/db_connections.r")
source("helpers/sql_queries.r")

#### app logic ####
shinyServer(function(input, output, session) {

    #### define reactive parameters based on required filters ####
    p_website <- reactive({
        input$button
        gsub(".com", "", tolower(isolate(input$website)))
    })
    
    #### define custom functions ####
    
    
    #### do other stuff ####
    
})