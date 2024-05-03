# Client: University of Lucerne
# Project: Data Mining Class Exercise 2
# Script: 05_sentiment_viz
# Authors: Camila and Jessica
# Date 03/05/2024
# R version 4.3.1

# Histogram for visualization---------------------------------------------------------------

library(ggplot2)

# Creating a new column to categorize sentiment scores
sentiment_analysis <- sentiment_analysis %>%
  mutate(sentiment_category = ifelse(sentiment_score >= 0, "Positive", "Negative"))

# Plotting bar plot
ggplot(sentiment_analysis, aes(x = author, y = sentiment_score, fill = sentiment_category)) +
  geom_bar(stat = "identity", position = "identity") +
  ggtitle("Sentiment Analysis by Author") +
  xlab("Author") +
  ylab("Sentiment Score") +
  scale_fill_manual(values = c("Positive" = "blue", "Negative" = "red")) +
  ylim(-100, 100) +  # Setting y-axis limits
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot
ggsave("histogram.png", plot = , path = "/Applications/Working_Directory/IHRS/ihrs-hypothesis/CE2_Camila_Jessica/Figures", width = 10, height = 8, units = "in")


