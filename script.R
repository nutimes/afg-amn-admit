################################################################################
#         FEATURE INSIGHTS ON AFGHANISTAN ACUTE MALNUTRITION ADMISSIONS        #
#                            ANALYSIS WORKFLOW                                 #
################################################################################

## ---- Load required libraries ------------------------------------------------
library(tidyr)
library(dplyr)
library(lubridate)
library(tsibble)
library(feasts)
library(ggplot2)
library(fable)
library(sf)
library(cyphr)

## ---- Retrieve secret key ----------------------------------------------------
secret_key <- data_key(".", Sys.getenv("path_secret_key"))

## ---- Read data in -----------------------------------------------------------
source("scripts/read-in-data.R")

## ---- Read data in -----------------------------------------------------------
source("scripts/data-wrangling.R")
