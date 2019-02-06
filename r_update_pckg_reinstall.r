# R upgrade package reinstallation
# because R is silly and removes all your packages when you upgrade
# written by: jane yang 
# last edited: feb 6, 2019

# install core packages
install.packages(c("tidyverse", "devtools", "lubridate", "knitr", "rmarkdown", 
    "ggthemes", "googlesheets", "googledrive", "keyring"))

# install database connector packages
install.packages(c("RODBC", "RJDBC", "RMariaDB", "bigrquery", "rgeolocate"))

# install packages related to shiny
install.packages(c("shiny", "shinythemes", "shinyBS", "rsconnect"))

# install packages for mapping / geospatial analysis
install.packages(c("ggvis", "rgdal", "sp", "raster", "rgeos", "RgoogleMaps",
    "mapproj", "maptools", "leaflet"))

# install packages for statistical analysis 
install.packages(c("radiant", "xray", "xtable", "NbClust", "fpc",
    "multcomp", "optmatch", "MatchIt", "randomForest", "stargazer", "pwr", 
    "forecast", "seasonal", "caret", "forecastHybrid"))

# install packages for interesting visualizations
install.packages(c("circlize", "wordcloud"))

# install packages for formatting
install.packages(c("xkcd", "extrafont", "acepack"))

# Alternatively, you can follow the instructions at this link to store, upgrade
# and then reload all the packages you have installed:
# https://www.datascienceriot.com/how-to-upgrade-r-without-losing-your-packages/kris/
