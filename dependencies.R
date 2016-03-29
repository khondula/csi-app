install_missing <- function(pkgs, repos) {
  missing_pkgs <- setdiff(pkgs, rownames(installed.packages()))
  if (length(missing_pkgs) > 0) install.packages(missing_pkgs, repos = repos)
}

pkg_list <- c("tidyr", "dplyr", "RSQLite", "sp", "rgdal", "rgeos",
              "raster", "shiny", "shinythemes", "leaflet")

# install.packages("raster", repos = "http://cran.us.r-project.org")
install_missing(pkg_list, repos = "http://cran.us.r-project.org")

library(tidyr)
library(dplyr)
library(RSQLite)
library(sp)
library(rgdal)
library(rgeos)
library(raster)
library(shiny)
library(shinythemes)
library(leaflet)

cb_dir <- "Data/cb_2014_us_county_500k"
counties <- readOGR(dsn = file.path(cb_dir, "cb_2014_us_county_500k.shp"),
                    layer = "cb_2014_us_county_500k", stringsAsFactors = FALSE)
counties_md <- counties[counties$STATEFP == "24", ]  # 24 is the FIPS code for Maryland

nlcd <- raster("Data/nlcd_agg.grd")

plots <- read.csv("Data/plots.csv", stringsAsFactors = FALSE)
species <- read.csv("Data/species.csv", stringsAsFactors = FALSE)
surveys <- read.csv("Data/surveys.csv", na.strings = "", stringsAsFactors = FALSE)
