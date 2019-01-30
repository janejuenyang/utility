###############################################################################
# PURPOSE: collection of regularly used functions and dataframes
# NAMED AFTER: Marian Wright Edelman (https://www.childrensdefense.org/staff/marian-wright-edelman/)
# TO USE: source("~/Work/data_scratchpad/r_marian.r")
# LAST EDITED: jan 30, 2019
###############################################################################

#### set up ####
# clear environment and console
rm(list = ls())
cat("\014")

# standard libraries
library(tidyverse)
library(DBI)
library(readxl)
library(lubridate)
library(keyring)

#### dataframes ####

# color palette
# from https://github.com/basecamp/bc3/blob/master/app/assets/stylesheets/all/mixins/colors.scss

d_colors <- c(
      "#1b6ac9" # blue
    , "#a4d2ff" # light blue
    , "#2da562" # green
    , "#d4442e" #red
    , "#ff5400" # orange 
    , "#ffa235" # orange-light 
    , "#725ead" # purple
    , "#5856d6" # violet 
    , "#8b599e" # magenta 
    , "#ff2d55" # pink 
    , "#f76480" # pink-light 
    , "#ecc542" # yellow
    , "#ffdb4d" # gold 
    , "#b1b1b3" # lime 
    , "#c1d739" # lime-light 
    , "#b3c833" # lime-medium 
    , "#8c9c29" # lime-dark 
    , "#34aadc" # aqua 
    , "#877457" # uncolor (brownish)
    , "#aba7a0" # uncolor-dark 
    , "#4285f4" # google-blue 
    , "#283c46" # ink 
    , "#333"    # black-80 
    , "#6d6d6d" # black-50 
)

# pretty labels to products for graphs
d_labels <- tibble(
    application = c("backpack", "basecamp", "bcx", "bc3", "campfire",
        "highrise", "skybox")
    , label = c("Backpack", "Basecamp Classic", "BCX", "BC3", "Campfire",
        "Highrise", "37s Suite")
)

# when legacy products were retired
d_retired <- d_labels %>% 
    # remove bc3 since not yet retired
    filter(application != "bc3") %>%
    # add retirement dates
    mutate(date_retired = c(ymd("2014-02-14"), ymd("2014-03-06"), 
        ymd("2015-11-02"), ymd("2014-02-14"), ymd("2018-08-20"), 
        ymd("2014-02-14"))
    ) %>% 
    # sort by retirement date
    arrange(date_retired); d_retired
