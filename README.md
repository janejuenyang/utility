# Utility
This repo is a place to keep my housekeeping and handy reference scripts

# Getting set up with R and RStudio
## Why use them?
* R is a free, open source programming language specifically designed for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS.
* RStudio is an excellent IDE for R.
## Installation
1. Download [R](https://www.r-project.org/)
2. Download the desktop version of [RStudio](https://www.rstudio.com/products/rstudio/download/)
3. Open RStudio and then install a core set of packages by running [this script](https://github.com/janejuenyang/Utility/blob/master/r_update_pckg_reinstall.r)
## Suggestions
* Adjust the IDE pane layout to your liking by following [these steps](https://support.rstudio.com/hc/en-us/articles/200549016-Customizing-RStudio#pane-layout)
* Create a template for new files by using the [Code Snippet](https://support.rstudio.com/hc/en-us/articles/204463668-Code-Snippets?version=1.1.463&mode=desktop) functionality of RStudio. An example template is like this:
```
###############################################################################
# PURPOSE: 
# LAST EDITED: 
############################################################################### . 

#### set up ####
# tunnel into queenbee
# load standard libraries, connections, etc.
source("~/Work/data_scratchpad/r_marian.r")

# define directories
wd <- "~/Work/"
dd <- paste(wd, "data", sep = "/")
od <- paste(wd, "output", sep = "/")

#### load data files ####

#### close all connections ####
close_dbConnections()
```
* Bookmark [R for Data Science](https://r4ds.had.co.nz/), a great reference book written by [Hadley Wickham](https://en.wikipedia.org/wiki/Hadley_Wickham)
