# Client: University of Lucerne
# Project: Data Mining Class Exercise 2
# Script: Mental Health Articles
# Authors: Camila and Jessica
# Date 03/05/2024
# R version 4.3.1


rm(list = ls())

install.packages(c("dplyr", "httr", "rvest", "tidyverse", "purrr"))

library(dplyr)
library(httr)
library(rvest)
library(tidyverse)
library(purrr)



# Set API key and endpoints
api_key <- rstudioapi::askForPassword("Enter Guardian API Key")
base_url <- "https://content.guardianapis.com/search"
query_params <- list(
  q = "mental health",
  "api-key" = api_key,
  "show-fields" = "body,byline"  # Requesting body text and byline
)

# Construct URL and make the GET request
url <- modify_url(base_url, query = query_params)
response <- GET(url)

# Process the response
if (http_status(response)$category == "Success") {
  data <- content(response, "parsed")
  
# Extract fields from results
  articles <- map(data$response$results, function(article) {
    list(
      title = article$webTitle,
      body = article$fields$body,
      author = article$fields$byline
    )
  })
}
  
# Converting list to a dataframe
# If Articles is a list of lists with title, body, and author
articles_df <- map_df(data$response$results, function(article) {
  data.frame(
    title = coalesce(article$webTitle, ""),
    body = coalesce(article$fields$body, ""),
    author = coalesce(article$fields$byline, "")
  )
}, .id = "article_id")

# Save data CSV file---------------------------------------------------------
write.csv(articles_df, "data.csv", row.names = FALSE)
