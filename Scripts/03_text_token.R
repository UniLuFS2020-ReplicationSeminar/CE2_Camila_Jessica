# Client: University of Lucerne
# Project: Data Mining Class Exercise 2
# Script: 03_text_token
# Authors: Camila and Jessica
# Date 03/05/2024
# R version 4.3.1


# Tokenization ------------------------------------------------------------

library(tidyverse)
library(tidytext)

articles_df <- read_csv("articles_df.csv") %>% 
  select(-article_id, -title, -body)

tidy_script <- articles_df %>%
  unnest_tokens(output = word, input = text)

# Stop Words --------------------------------------------------------------

View(stop_words)

tidy_script <- tidy_script %>%
  anti_join(stop_words, by = "word")

plot_data <- tidy_script %>%
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

res <- tidy_script %>%
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

tidy_script <- articles_df %>% 
  unnest_tokens(output = word, input = text) %>% 
  anti_join(stop_words, by ="word")

plot_data <- tidy_script %>% 
  filter() %>% 
  group_by(word) %>% 
  summarise(n = n()) %>% 
  ungroup() %>% 
  mutate(word = factor(word),
         freq = as.numeric(n)) %>% 
  arrange(desc(freq))

wordcloud2(data = plot_data, size = 1, color = 'random-dark')
