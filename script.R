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

## ---- Read project-specific functions ----------------------------------------
lapply(list.files(path = "R", full.names = TRUE), FUN = source)

## ---- Read data in -----------------------------------------------------------
source("scripts/read-in-data.R")

## ---- Wrangle admissions data  -----------------------------------------------
source("scripts/data-wrangling-amn.R")
source("scripts/data-wrangling-morbidity.R")

## ---- Run Exploratory data analysis on admissios -----------------------------
source("scripts/eda-graphics.R")

## ---- Decompose admissions into trend and seasonality  -----------------------
source("scripts/decomposition-amn.R")
source("scripts/decomposition-morbidity.R")

## ---- Understand the seasonal component --------------------------------------
source("scripts/seasonal-component-amn.R")
source("scripts/seasonal-component-morbidity.R")

############################## End of Workflow #################################