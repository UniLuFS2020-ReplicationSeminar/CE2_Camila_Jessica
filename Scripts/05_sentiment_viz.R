# Client: University of Lucerne
# Project: Data Mining Class Exercise 2
# Script: 05_sentiment_viz
# Authors: Camila and Jessica
# Date 03/05/2024
# R version 4.3.1

#----------- histogram for visualization
library(ggplot2)

ggplot(sentiment_analysis, aes(x=sentiment_score)) +
  geom_histogram(bins = 50, fill="blue", color="black") +
  ggtitle("Distribution of Sentiment Scores") +
  xlab("Sentiment Score") +
  ylab("Frequency")


# Save the plot
ggsave("histogram.png", plot = , path = "C:/Users/Jessica J. Ugowe/Desktop/CE2_Camila_Jessica/Figures", width = 10, height = 8, units = "in")


