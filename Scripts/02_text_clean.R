# Client: University of Lucerne
# Project: Data Mining Class Exercise 2
# Script: 02_text_clean
# Authors: Camila and Jessica
# Date 03/05/2024
# R version 4.3.1

# -------------Text cleaning
#gsub function in R is used for pattern matching and replacement. It stands for "global substitution" 
articles_df <- articles_df %>%
  mutate(text = tolower(text),  #make all words lowercase
         text = gsub("[[:punct:]]", "", text), #remove punctuation
         text = gsub("[[:digit:]]", "", text))  #remove numbers

