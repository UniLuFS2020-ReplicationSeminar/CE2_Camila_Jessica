# Client: University of Lucerne
# Project: Data Mining Class Exercise 2
# Script: 01_text_prep
# Authors: Camila and Jessica
# Date 03/05/2024
# R version 4.3.1

setwd("/Applications/Working_Directory/IHRS/ihrs-hypothesis/CE2_Camila_Jessica/Data/")
source("mentalhealth_articles.R")

# Text Preprocessing---------------------------------------------------------------
library(dplyr)
library(tidytext)

articles_df <- articles_df %>%
  mutate(text = paste(title, body))

