# R upgrade package reinstallation
# because R is silly and removes all your packages when you upgrade
# written by: jane yang 
# last edited: dec 2, 2017

# install packages
install.packages(c("ggplot2", "devtools", "dplyr", "shinythemes", "shinyBS", 
    "ggvis", "RColorBrewer", "rgdal", "sp", "raster", "stringr", "tidyr", 
    "shiny", "reshape2", "circlize", "radiant", "foreign", "knitr", "rgeos",
    "rmarkdown", "xtable", "wordcloud", "RgoogleMaps", "NbClust", "fpc",
    "mapproj", "maptools", "multcomp", "optmatch", "MatchIt", "readxl", 
    "rsconnect", "leaflet", "randomForest", "ggthemes", "googlesheets", 
    "tibble", "data.table", "cowplot", "stargazer", "pwr", "forecast", 
    "seasonal", "quantmod", "caret", "xray"))

# configure computer to allow app uploads to oaf's shinyapps.io account
# rsconnect::setAccountInfo(name='oneacrefund',
#     token='BFAC4158F910A46EDAA76F865333E4D1',
#     secret='Pb4CP680U1rcoGCgJhKlh5PZ3VGHR3+Bn/A0MNVM')

# Alternatively, you can follow the instructions at this link to store, upgrade
# and then reload all the packages you have installed:
# https://www.datascienceriot.com/how-to-upgrade-r-without-losing-your-packages/kris/
