# Client: University of Lucerne
# Project: Data Mining Class Exercise 2
# Script: 02_text_clean
# Authors: Camila and Jessica
# Date 03/05/2024
# R version 4.3.1

# Text cleaning--------------------------------------------------------------

articles_df <- articles_df %>%
  mutate(text = tolower(text),  
         text = gsub("[[:punct:]]", "", text), 
         text = gsub("[[:digit:]]", "", text))  

# Save data CSV file---------------------------------------------------------
write.csv(articles_df, "articles_df.csv", row.names = FALSE)
