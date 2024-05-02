
#------  sentiment analysis preparation
# Load AFINN sentiment lexicon
sentiments <- get_sentiments("afinn")

# Join with sentiment lexicon
sentiment_analysis <- words_df %>%
  inner_join(sentiments, by = "word") %>%
  group_by(article_id) %>%
  summarize(sentiment_score = sum(value), .groups = 'drop')

#-------------sentiment scores for each article
print(sentiment_analysis)
