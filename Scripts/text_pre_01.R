setwd("C:/Users/Jessica J. Ugowe/Desktop/CE2_Camila_Jessica/data")
source("mentalhealth_articles.R")

#---------------TEXT PREPROCESSING
library(dplyr)
library(tidytext)

# Combine title and body into one text column
articles_df <- articles_df %>%
  mutate(text = paste(title, body))


