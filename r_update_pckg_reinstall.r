# R upgrade package reinstallation
# because R is silly and removes all your packages when you upgrade
# written by: jane yang
# last edited: 10 apr 2023

# install core packages
install.packages(c("tidyverse", "devtools", "lubridate", "knitr", "rmarkdown",
    "ggthemes", "googlesheets4", "googledrive", "keyring", "directlabels",
    "urltools", "xray", "openssl", "usethis", "reticulate", "janitor"))

# install database connector packages
install.packages(c("DBI", "pool", "RODBC", "RJDBC", "RMariaDB", "bigrquery",
    "rgeolocate", "rredis", "elasticsearchr"))

# install packages related to shiny
install.packages(c("shiny", "shinythemes", "shinyBS", "rsconnect",
    "shinyloadtest", "shinydashboard", "plotly", "shinycssloaders", "DT",
    "cronR", "promises", "golem"))

# install packages for mapping / geospatial analysis
install.packages(c("ggvis", "rgdal", "sp", "raster", "rgeos", "ggmap",
    "mapproj", "maptools", "leaflet", "sf", "ggrepel", "ggspatial",
    "libwgeom", "rnaturalearth", "rnaturalearthdata", "cowplot", "tmaptools"))

# install packages for statistical analysis
install.packages(c(
    # for general explorations
     "skimr", "radiant"
    # for specific data wrangling
    , "urltools"
    # for predictive modeling
    , "caret", "glmnet"
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
    # for survey analysis,
    , "srvyr"
    # for survival analysis
    , "survival", "ranger", "survminer", "flexsurv", "muhaz"
    # for classification analysis
    , "cluster", "factoextra", "fpc", "NbClust", "randomForest"
    # for exporting pretty table results to LaTeX or HTML
    , "xtable", "stargazer", "gt", "webshot2", "gtsummary"

))

# install packages for interesting visualizations
install.packages(c("circlize", "wordcloud", "networkD3", "gganimate", "tweenr",
    "transformr", "gifski", "ggalluvial", "statnet", "GGally", "ggrepel"))

# install packages for formatting
install.packages(c("xkcd", "extrafont", "acepack", "pals"))

# install packages for fun
devtools::install_github("brooke-watson/BRRR")

# install miscellaneous dataset packages
install.packages(c("quantmod", "ipumsr"))

# Alternatively, you can follow the instructions at this link to store, upgrade
# and then reload all the packages you have installed:
# https://www.datascienceriot.com/how-to-upgrade-r-without-losing-your-packages/kris/
