###############################################################################
# PURPOSE: define stuff you want to run before loading the ui and server
# LAST EDITED: nov 11, 2019
###############################################################################

# libraries
library(shinydashboard)
library(profvis) # for profiling code, helpful for performance optimizing
library(shinytest) # for easier testing and debugging
library(tidyverse)
library(lubridate) # easy date manipulation
library(scales) # better graph scale labeliing
library(DBI) # database connections
library(bigrquery) # for connecting to Google BigQuery
library(RMariaDB) # for connecting to MySQL databases
library(glue) # for MySQL parameterized queries with arrays
library(pool) # database connection management
library(keyring) # for retrieving login secrets
library(urltools) # for easier url parsing
library(shinycssloaders) # for loading visual
library(plotly) # for interactive graphs that play nice with ggplot2

# required to avoid http2 issues on ubuntu
httr::set_config(httr::config(http_version = 0), override = TRUE)
