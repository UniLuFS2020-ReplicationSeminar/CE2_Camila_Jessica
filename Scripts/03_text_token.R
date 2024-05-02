
#------------Text tokenization
words_df <- articles_df %>%
  unnest_tokens(word, text)

#--------removing stop words
data(stop_words)
words_df <- words_df %>%
  #the anti_join function is used to remove all rows from word_df that has a word which is also present in stop_words
  anti_join(stop_words, by = "word") 

