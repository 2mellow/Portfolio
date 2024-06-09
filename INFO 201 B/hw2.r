#Markell Thornton
#markell2@uw.edu
#I worked on this assignment alone using only this quarter's course materials

library("stringr") #loads in the stringr library, all library statements must be at the top of the page! 
library(dplyr)
# Note: You may have to run: install.packages("testthat")
library(testthat)

# Note: make sure to set your source-> working directory to current file location
games_df <- read.csv("2013_Video_Games_Dataset.csv") #loads in your dataset DO NOT CHANGE!!

# Overview ---------------------------------------------------------------------

# Homework 2: Video Game Market Analysis
# Before you begin, make sure you read the assignment description on canvas first!
#
# For each question/prompt, write the necessary code to calculate the answer.
#
# For grading, it's important that you store your answers in the variable names
# listed with each question in `backtics`. We will use a modified version of 
# the dataset to grade your work, so make sure you are calculating values from 
# the dataset (instead of just saving the answer values into the variables).
#
# You can save extra variables we didn't ask for
#
# When you save answers, make sure you save the values and not dataframes (unless
# we ask you to save dataframes).
#
# Do not change the address for the dataset file. 

# Part 1: Background Math ------------------------------------------------------
#
# In this section, you will be calculating some general numbers about this dataset
# that you'll need later as reference values!
#
# ------------------------------------------------------------------------------

# How many games in total are in this dataset? Store this value into a variable called `total_games`
total_games <- nrow(games_df)


# Make a new dataframe called `sequel_games_df` with just the games that are sequels
sequel_games_df <- games_df %>%
  filter(Sequel > 0)

# How many games are sequels? Store this value into a variable called `total_seq`
total_seq <- nrow(sequel_games_df)
print(nrow(sequel_games_df))
print(total_seq)

# What percentage of games in the dataset are sequels? Round this number to the nearest whole number/integer 
# and store into a variable called `perc_seq`
perc_seq <- round((nrow(sequel_games_df) / total_games) * 100)

# We now want to figure out information about games that were published by AAA studios.
# The AAA studios are:  Activision, Nintendo, Rockstar, Sony, Disney, Electronic Arts, and Microsoft
# Below we provide you with a regular expression (regex) pattern to let you check if a text
# contains any of those studio names:
aaa_studios_pattern <- "Activision|Nintendo|Rockstar|Sony|Disney|Electronic Arts|Microsoft"


# Open the games_df dataframe and copy text for one of the publishers, and put save it in
# a variable called `example_publisher_text`
example_publisher_text = "Bandai Co., Ltd., Ubisoft Entertainment SA, Ubisoft, Inc."

# Now try to write code to see if that publisher text has one of those studio names.
# Save the result in a variable called `is_example_publisher_aaa`
is_example_publisher_aaa <- str_detect(example_publisher_text, aaa_studios_pattern)

# Update the games_df to have a new column called `Is_AAA` if a game is produced by an AAA studio
# Hint: Use mutate and re-save the result into `games_df`
games_df <- games_df %>%
  mutate(Is_AAA  = str_detect(Publisher, aaa_studios_pattern))

# How many games in this dataset were published by an AAA studio?
# Store this value into a variable called `total_AAA_games`
# Hint: You can use filter() to help answer this
total_AAA_games <- games_df %>%
  filter(Is_AAA == TRUE) %>%
  nrow()
  
# What percentage of games where published by an AAA studio? Round this number to the nearest whole number
# and store into a variable called `perc_AAA`. You should use the round function for this task. 
perc_AAA <- round((total_AAA_games / total_games) * 100)

# Next we want to look at games that were published by a company that also made 
# console hardware that many video games are played on (Nintendo, Microsoft, or Sony)?
# Below we provide you with a regular expression (regex) pattern to let you check if a text
# contains any of those studio names:
hardware_studios_pattern <- "Nintend|Sony|Microsoft"


# Update the games_df to have a new column called `Is_Hardware_Studio` if a 
# game is produced by one of the hardware studios
games_df <- games_df %>%
  mutate(Is_Hardware_Studio = str_detect(Publisher, hardware_studios_pattern))

# How many games in this dataset were published by a company that also made the same console hardware 
# many of the videogames are played on? i.e how many of these games are published by Nintendo, Microsoft, or Sony? 
# Store this value into a variable called `total_hardware_games`
total_hardware_games <- games_df %>%
  filter(Is_Hardware_Studio == TRUE) %>%
  nrow()

# What percentage of games where published by a company that also makes the console hardware? Round this number up to the nearest whole number
# and store into a variable called `perc_hardware`
perc_hardware <- round((total_hardware_games / total_games) * 100)

# Part 2: Examining Sales and Market Share ---------------------------------------------
#
# In this section, you will be analyzing trends in the video game market. Your
# analysis will help tell a story about how the "rich get richer" phenomena is 
# present in the video game industry as part of a larger story around 
# "What makes a blockbuster video game?". 
#
# ------------------------------------------------------------------------------

# What is the highest US sales in millions of dollars reported for any game in the dataset?
# Store this in a variable called `best_seller_sales_millions`. 
best_seller_sales_millions <- max(games_df$US.Sales..millions.)
                                  
# What was the title of this best selling game? 
# Store this value into a variable called `best_seller`.
best_seller <- games_df %>%
  slice(which.max(US.Sales..millions.)) %>%
  pull(Title)

# How much money did that game make (in actual dollars not millions of dollars)?
# Store this in a variable called `best_seller_sales`. 
best_seller_sales <- max(games_df$US.Sales..millions.) * 1000000


# Similarly, what is the lowest US sales in millions of dollars reported for any game in the dataset?
# Store this in a variable called `worst_seller_sales_millions`.
worst_seller_sales_millions <- min(games_df$US.Sales..millions.) * 1000000

# What were the titles of worst selling games in the entire dataset?
# Note: There may be more than one title that tied for selling the worst. 
# Store this value into a variable called `worst_seller`.  Make sure you save the values and not a dataframe.
worst_seller <- games_df$Title[games_df$US.Sales..millions. == min(games_df$US.Sales..millions.)]

# How much money did that game (or one of those games) make (in actual dollars not millions of dollars)?
# Store this in a variable called `worst_seller_sales`. 
worst_seller_sales <- as.numeric(worst_seller_sales_millions)

# Fill in the function below called `best_per_yr` that takes in a numeric parameter `year`
# and returns the title of the best selling video games released that year. 
# Your function should return a string/character datatype (not a dataframe)!
best_per_yr <- function(year){
  filtered_data <- games_df %>% 
    filter(YearReleased == year)
  title <- filtered_data$Title[which.max(filtered_data$US.Sales..millions.)]
  return(title)
}

# Use your function to determine the best selling game of 2010.
# Store this in a variable called `top_seller_2010`.
top_seller_2010 <- best_per_yr(2010)

# Use your function to determine the best selling game of 2005.
# Store this in a variable called `top_seller_2005`.
top_seller_2005 <- best_per_yr(2005)

# Now let's examine the distribution of game sales across the dataset. To do this,  
# get mean and the median sales value (in millions of US dollars). 
#Store these two values respectively into  variables named `mean_sales` and `median_sales`.
mean_sales <- mean(games_df$US.Sales..millions.)
median_sales <- median(games_df$US.Sales..millions.)

# Examine values (in US millions) of the mean sales and median sales (and compare with
# the worst sales and best sales). 
#
# What does the difference between mean and median tell you? How would you characterize
# a "normal" amount of sales and an "unusual" amount of sales based on this?
# 
# Save your answer as text saved into a variable called mean_median_explanation
mean_median_explanation <- "The difference between the mean and median provides insights into the distribution of sales data. If the mean is significantly larger than the median, it suggests that there are a few extremely high sales values that are pulling the mean upwards, indicating a right-skewed distribution. Conversely, if the median is significantly larger than the mean, it suggests that there are a few extremely low sales values that are pulling the mean downwards, indicating a left-skewed distribution. If the mean and median are close together, it suggests that the distribution of sales values is relatively balanced, without extreme outliers. A 'normal' amount of sales would typically fall around the median value, representing the midpoint of the sales distribution. An 'unusual' amount of sales would deviate significantly from the median and might be closer to the extremes of the distribution, depending on whether the distribution is skewed to the right or left."


# How many games in this dataset sold above the average (mean) amount? 
# Store this value into a variable named `above_avg_total` 
above_avg_total <- sum(games_df$US.Sales..millions. > mean_sales)

# What percentage of games sold above average (rounded to nearest whole number)?
# Store this value into a variable named `above_avg_percent` 
above_avg_percent <- round((above_avg_total / total_games) * 100)

# Next we want to know look at games that sold way more than average. We will 
# define "above and beyond" to mean games that sold more than two standard deviations
# higher than the average.

# Calculate the standard deviation of game sales 
# Hint: you can Google for the R function to find the standard deviation
# Store this value into a variable named `std_dev_sales` 
mean_sales <- mean(games_df$US.Sales..millions.)
std_dev_sales <- sd(games_df$US.Sales..millions.)

# Now make a new dataframe called `above_beyond_games_df` with just the games that 
# sold "above and beyond" the average amount.
# That is, only the games sold more than the: mean + 2 * standard deviation
above_beyond_games_df <- games_df[games_df$US.Sales..millions. > (mean_sales + 2 * std_dev_sales), ]

# What percentage of games sold "above and beyond" average (rounded to nearest whole number)?
# Store this value into a variable named `above_beyond_avg_percent` 
above_beyond_avg_percent <- round((nrow(above_beyond_games_df) / nrow(games_df)) * 100)

# Of those games that sold above and beyond the average amount, what percent were produced by an AAA publisher? 
# Reminder that AAA in this case means Activision, Nintendo, Rockstar, Sony, Disney, Electronic Arts, or Microsoft
# Note: You should already have a column that tells you if it is an AAA Publisher game
# Round your answer to the nearest whole number and store it in a variable named `above_beyond_aaa_percent`
above_beyond_aaa_percent <- round((sum(above_beyond_games_df$Is_AAA) / nrow(above_beyond_games_df)) * 100)
print(above_beyond_aaa_percent)

# Of those games that sold about and beyond the average amount, what percent were published 
# by companies that also make the same console hardware many of the video games are played on?
# i.e what percent of these games are published by Nintendo, Microsoft, or Sony
# Round your answer to the nearest whole number and store it in a variable named `above_beyond_hardware_percent`
above_beyond_hardware_percent <- round((sum(above_beyond_games_df$Is_Hardware_Studio) / nrow(above_beyond_games_df)) * 100)

# Next we want to know look at games that sold less than average.
# Make a new dataframe of these called `below_avg_games_df`
# That is, only the games sold less than the mean
# Note: we can't do way worse than average (mean - 2 * std_dev), since that is a negative number
below_avg_games_df <- games_df[games_df$US.Sales..millions. < mean_sales, ]

# What percentage of games sold below than average (rounded to nearest whole number)?
# Store this value into a variable named `below_avg_percent` 
below_avg_percent <- round((nrow(below_avg_games_df) / nrow(games_df)) * 100)

# Of those games that sold below the average amount, what percent were produced by an AAA publisher? 
# Reminder that AAA in this case means Activision, Nintendo, Rockstar, Sony, Disney, Electronic Arts, or Microsoft
# Note: You should already have a column that tells you if it is an AAA Publisher game
# Round your answer to the nearest whole number and store it in a variable named `below_avg_aaa_percent`
below_avg_aaa_percent <- round((sum(below_avg_games_df$Is_AAA) / nrow(below_avg_games_df)) * 100)

# Of those games that sold below the average amount, what percent were published 
# by companies that also make the same console hardware many of the video games are played on?
# i.e what percent of these games are published by Nintendo, Microsoft, or Sony
# Round your answer to the nearest whole number and store it in a variable named `below_avg_hardware_percent`
below_avg_hardware_percent <- round((sum(below_avg_games_df$Is_Hardware_Studio) / nrow(below_avg_games_df)) * 100)


#To run the test file, uncomment the line below before running source. 
test_file("hw2_test.r")

