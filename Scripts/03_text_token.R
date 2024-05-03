# Client: University of Lucerne
# Project: Data Mining Class Exercise 2
# Script: 03_text_token
# Authors: Camila and Jessica
# Date 03/05/2024
# R version 4.3.1


# Tokenization ------------------------------------------------------------

library(tidyverse)
library(tidytext)

articles_select <- read_csv("articles_df.csv") %>% 
  select(-article_id, -title, -body)

word_df <- articles_select %>%
  unnest_tokens(output = word, input = text)

# Stop Words --------------------------------------------------------------

View(stop_words)

word_df <- word_df %>%
  anti_join(stop_words, by = "word")

plot_data <- word_df %>%
  group_by(word, author) %>%
  summarise(n = n()) %>% 
  ungroup() %>% 
  group_by(author) %>%
  top_n(10) %>%
  ungroup()

plot_data %>% 
  ggplot(aes(x = word, y = n, fill = author)) +
  geom_col() +
  facet_wrap(~author, ncol = 3, scales = "free_y") +
  coord_flip() +
  theme(axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        legend.position = "none")

res <- word_df %>%
  group_by(word, author) %>%
  summarise(n = n()) %>% 
  ungroup() %>% 
  group_by(author) %>%
  top_n(1) %>%
  ungroup() %>% 
  arrange(desc(n))

View(res)

# Wordcloud ---------------------------------------------------------------

library(tidyverse)
library(tidytext)
library(wordcloud2)

word_df <- articles_df %>% 
  unnest_tokens(output = word, input = text) %>% 
  anti_join(stop_words, by ="word")

plot_data <- word_df %>% 
  filter() %>% 
  group_by(word) %>% 
  summarise(n = n()) %>% 
  ungroup() %>% 
  mutate(word = factor(word),
         freq = as.numeric(n)) %>% 
  arrange(desc(freq))

wordcloud2(data = plot_data, size = 1, color = 'random-dark')
