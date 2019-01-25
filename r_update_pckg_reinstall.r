# R upgrade package reinstallation
# because R is silly and removes all your packages when you upgrade
# written by: jane yang 
# last edited: jan 25, 2019

# install core packages
install.packages(c("tidyverse", "devtools", "lubridate", "knitr", "rmarkdown", 
    "RODBC", "RJDBC", "RMySQL", "ggthemes", "googlesheets", "keyring"))

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

# configure computer to allow app uploads to oaf's shinyapps.io account
# rsconnect::setAccountInfo(name='oneacrefund',
#     token='BFAC4158F910A46EDAA76F865333E4D1',
#     secret='Pb4CP680U1rcoGCgJhKlh5PZ3VGHR3+Bn/A0MNVM')

# Alternatively, you can follow the instructions at this link to store, upgrade
# and then reload all the packages you have installed:
# https://www.datascienceriot.com/how-to-upgrade-r-without-losing-your-packages/kris/
