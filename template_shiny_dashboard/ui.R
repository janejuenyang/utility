###############################################################################
# PURPOSE: ui for dashboard
# LAST EDITED: 
###############################################################################

#### title ####
header <- dashboardHeader(
      title = "Show me data for..."
    , dropdownMenu(
          type = "notifications"
        , notificationItem(
              text = "Data source: Beanstalk"
            , icon = icon("seedling")
            , status = "info"
        )
        , notificationItem(
              text = "Data is updated daily at 3:15am UTC"
            , icon = icon("sync")
            , status = "info"
        )
        , notificationItem(
              text = "Missing signups 8/27/19-9/13/19"
            , icon = icon("exclamation-triangle")
            , status = "warning"
        )
        , notificationItem(
              text = "Ask Jane if you see a red error message"
            , icon = icon("question-circle")
            , status = "danger"
        )
    )
)
    
#### filters ####
sidebar <- dashboardSidebar(
      helpText(
          HTML('&emsp;') # janky whitespace addition
        , tags$b("To use:")
        , br()
        , HTML('&emsp;')
        , "1. Pick website and time window"
        , br()
        , HTML('&emsp;')
        , "2. Hit the 'Pull data' button"
    ) 
    , actionButton("button", "Pull data")
    , helpText(
          HTML('&emsp;')
        , "Built in R:"
        , tags$a(
              href="insert github URL"
            , "source code"
        )
    )
)

#### visualizations ####
options(spinner.color="#f39c12")

body <- dashboardBody(
        # use 2-col format
        fluidRow( 
              column (
                  width = 6
                , box(
                      width = NULL
                    , title = ""
                )
                , box(
                      width = NULL
                    , title = ""
                )
              )
            , column (
                  width = 6
                , box(
                      width = NULL
                    , title = ""
                )
                , box(
                      width = NULL
                    , title = ""
                )
            )
        )
    )

#### putting it all together! ####
dashboardPage(header, sidebar, body, skin = "yellow")