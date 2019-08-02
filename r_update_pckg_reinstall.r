# R upgrade package reinstallation
# because R is silly and removes all your packages when you upgrade
# written by: jane yang 
# last edited: aug 2, 2019

# install core packages
install.packages(c("tidyverse", "devtools", "lubridate", "knitr", "rmarkdown", 
    "ggthemes", "googlesheets", "googledrive", "keyring", "directlabels", 
    "urltools"))

# install database connector packages
install.packages(c("RODBC", "RJDBC", "RMariaDB", "bigrquery", "rgeolocate"))

# install packages related to shiny
install.packages(c("shiny", "shinythemes", "shinyBS", "rsconnect"))

# install packages for mapping / geospatial analysis
install.packages(c("ggvis", "rgdal", "sp", "raster", "rgeos", "RgoogleMaps",
    "mapproj", "maptools", "leaflet", "sf", "ggrepel", "ggspatial", 
    "libwgeom", "rnaturalearth", "rnaturalearthdata", "cowplot"))

# install packages for statistical analysis 
install.packages(c(
    # for general explorations
     "xray", "radiant"  
    # for predictive modeling
    , "caret" 
    # for logit regressions
    , "pROC", "rJava", "glmulti" 
    # for multi-variate (e.g. anova) tests
    , "multcomp" 
    # for time series analysis
    , "forecast", "seasonal", "forecastHybrid", "tsbox"
    # for matching controls (e.g. propensity scores)
    , "optmatch", "MatchIt" 
    # for A/B testing
    , "pwr", "bayesAB"
    # for survival analysis
    , "survival", "ranger", "survminer" 
    # for classification analysis
    , "cluster", "factoextra", "fpc", "NbClust", "randomForest" 
    # for exporting results to LaTeX or HTML
    , "xtable", "stargazer" 
    
))

# install packages for interesting visualizations
install.packages(c("circlize", "wordcloud", "networkD3", "gganimate", "tweenr",
    "gifski", "ggalluvial", "statnet", "GGally"))

# install packages for formatting
install.packages(c("xkcd", "extrafont", "acepack"))

# install miscellaneous dataset packages
install.packages(c("quantmod"))

# Alternatively, you can follow the instructions at this link to store, upgrade
# and then reload all the packages you have installed:
# https://www.datascienceriot.com/how-to-upgrade-r-without-losing-your-packages/kris/
