
# -------------Text cleaning
#gsub function in R is used for pattern matching and replacement. It stands for "global substitution" 
articles_df <- articles_df %>%
  mutate(text = tolower(text),  #make all words lowercase
         text = gsub("[[:punct:]]", "", text), #remove punctuation
         text = gsub("[[:digit:]]", "", text))  #remove numbers

