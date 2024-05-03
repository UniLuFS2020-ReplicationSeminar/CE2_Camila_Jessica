# Client: University of Lucerne
# Project: Data Mining Class Exercise 2
# Script: 04_sentiment_anlys
# Authors: Camila and Jessica
# Date 03/05/2024
# R version 4.3.1

# Install packages
#install.packages("tidytext")
library("tidytext")

# Sentiment analysis preparation ---------------------------------------------------------------

sentiments <- get_sentiments("afinn")

sentiment_analysis <- word_df %>%
  inner_join(sentiments, by = "word") %>%
  group_by(author) %>%
  summarize(sentiment_score = sum(value), .groups = 'drop')

# Sentiment scores for each article---------------------------------------------------------------
print(sentiment_analysis)


