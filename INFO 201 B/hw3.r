#Markell Thornton
#Markell2@uw.edu
#Collaboration statement goes here

# Delete all variables in your workspace. This will make it easier to test your script.
rm(list = ls())

#all library statements must be at the top of the page!
library(dplyr)
library(stringr)
library(testthat)

# Overview ---------------------------------------------------------------------

# Homework 3: Food Desert Analysis

# Before you begin, make sure you read the assignment description on canvas first!
#
# For each question/prompt, write the necessary code to calculate the answer.
#
# For grading, it's important that you store your answers in the variable names
# listed with each question in `backtics`. We will use a modified version of 
# the dataset to grade your work, so make sure you are calculating values from 
# the dataset (instead of just saving the answer values into the variables).
#
# You are encouraged to create extra variables to help you solve these problems
#
# When you save answers, make sure you save the values and not dataframes (unless
# we ask you to save dataframes).
#
# Do not change the address for the dataset file. 


# Loads in your datasets
food_df <- read.csv("food_access.csv") #DO NOT CHANGE!
county_df <- read.csv("CountyCodes.csv") #DO NOT CHANGE!

# Make a dataframe out of US State names/abbreviations that R has included
state_name_abv_df <- data.frame(State.Code = state.abb, State.Name = state.name)


# Investigating King County(s) -------------------------------------------------
#
# In this homework assignment, you will be working with two related datasets.
#
# food_df has information on how far people have to travel to access a grocery 
# store (where you can buy healthier food than at a fast food restaurant or gas station)
#
# county_df has information about individual counties.
# 
# We will start by looking at "King County" in our two datasets.
#
# ------------------------------------------------------------------------------

# Count how many "King County"s there are in food_df. 
# Store it in a variable called `num_king_counties`
# Count how many "King County"s there are in food_df.
num_king_counties <- sum(str_detect(food_df$County, "King County"))
print(num_king_counties)

# Save the single row of data for King County, Washington (where Seattle is)
# in a dataframe called `king_county_df`
king_county_df <- food_df %>%
  filter(County == "King County", State == "Washington")

# How many people live in King County, Washington?
# Save in a variable called `king_county_pop`
king_county_pop <- king_county_df$Population

# What is the number of people in King County, Washington who live at least 1 mile from
# the nearest grocery store. Save this value as `king_county_1mi_num`
king_county_1mi_num <- king_county_df$Low.Access.Numbers.People.1.Mile
# What (rounded) percent of people in King County, Washington live at least 1 mile 
# from the nearest grocery store? Save this value as `king_county.mile_per
king_county_1mi_per <- round(king_county_1mi_num / king_county_pop * 100)

# Similarly, what (rounded) percent of people in King County, Washington live at least
#  10 miles from the nearest grocery store? Save this value as `king_county_10mi_per`
king_county_10mi_per <- round(king_county_df$Low.Access.Numbers.People.10.Miles / king_county_pop * 100)

# The US Department of Agriculture's definition of a food desert which is that a 
# county is considered a "food desert" if 33% or more of the population in that 
# county is located more than 1 mile (in urban counties) or 10 miles (in rural 
# counties) from the nearest supermarket or large grocery store.
# 
# To see if King County is a food desert, we need to know if it is urban or rural
# 
# Using the county_df dataframe, write code to determine if King County, Washington
# is urban or rural. Save a TRUE/FALSE value into a variable called
# `is_king_county_urban`
# Using the county_df dataframe, write code to determine if King County, Washington
# is urban or rural. Save a TRUE/FALSE value into a variable called
# `is_king_county_urban`
is_king_county_urban <- county_df %>%
  filter(County_name == "King County", State == "WA") %>%
  pull(Metro.nonmetro.status) == 1

# Now that you know whether King County is urban or rural, write a simple conditional
# test that uses the correct rule mentioned above to see if king county is a food
# dessert. Save the resulting TRUE/FALSE value in a variable called `is_king_county_food_desert`
is_king_county_food_desert <- if (is_king_county_urban) {
  sum(king_county_df$Low.Access.Numbers.People.1.Mile) / sum(king_county_df$Population) >= 0.33
} else {
  sum(king_county_df$Low.Access.Numbers.People.10.Miles) / sum(king_county_df$Population) >= 0.33
}

#
# Now we will look at "King County" in Texas
#

# How many people live in King County, Texas?
# Save in a variable called `king_county_tx_pop`
# How many people live in King County, Texas?
# Save in a variable called `king_county_tx_pop`
king_county_tx_pop <- food_df %>%
  filter(County == "King County", State == "Texas") %>%
  pull(Population)

# Using the county_df dataframe, write code to determine if King County, Texas
# is urban or rural. Save a TRUE/FALSE value into a variable called
# `is_king_county_tx_urban`
is_king_county_tx_urban <- length(county_df %>%
                                    filter(County_name == "King County", State == "Texas") %>%
                                    pull(Metro.nonmetro.status)) > 0

# What (rounded) percent of people in King County, Texas live at least 
# 1 or 10 miles (use what you learned to choose the relevant value) 
# from the nearest grocery store? Save this value as `king_county_tx_dist_per`
king_county_tx_df <- food_df %>%
  filter(County == "King County", State == "Texas")

king_county_tx_10mi_num <- king_county_tx_df$Low.Access.Numbers.People.10.Mile

king_county_tx_dist_per <- round(100*(king_county_tx_10mi_num) / king_county_tx_pop)
print(king_county_tx_dist_per)

# Now write a simple conditional to see if King County, Texas is a food
# dessert. Save the resulting TRUE/FALSE value in a variable called `is_king_county_tx_food_desert`
is_king_county_tx_food_desert <- if (is_king_county_tx_urban) {
  (king_county_tx_df$Low.Access.Numbers.People.1.Mile / king_county_tx_pop) >= 0.33
} else {
  (king_county_df$Low.Access.Numbers.People.10.Miles / king_county_tx_pop) >= 0.33
}

# Looking back on the data from King County Texas and Washington, what did you 
# observe? Do you find anything surprising or do you find things matching your expectations?
# Save your answer as text saved into a variable called `king_county_observations`
king_county_observations <- "n the king_county_tx_df, there are many areas where the reflected value is 0, which I personally find surprising. For example, vehicle.access.1mi.

I'm not surprised that the Washington population is higher than Texas, but the Texas population being that small is a bit surprising." 





# Overall US numbers -------------------------------------------------
#
# Now we'll look at a couple overall numbers from the US about access to food
#
# ------------------------------------------------------------------------------


# Find out what (rounded) percentage of people in the whole US live at least 1 mile from
# the nearest grocery store. Save this value as `per_1mi`
per_1mi <- round(sum(food_df$Low.Access.Numbers.People.1.Mile) / sum(food_df$Population) * 100)

# Find out what (rounded) percentage of people in the whole US live at least 10 milea from
# the nearest grocery store. Save this value as `per_10mi`
per_10mi <- round(sum(food_df$Low.Access.Numbers.People.10.Miles) / sum(food_df$Population) * 100)

# Data Joining -----------------------------------------------------------------
#
# In our overall numbers above, we looked at how many people lived at least 1 or 
# 10 miles from a grocery store. But in the US Department of Agriculture's definition 
# of a food desert, whether we should use 1 or 10 miles depends on if people live in a
# urban or rural county.
#
# Currently the rural/urban information and the distance from food information
# are in two different datasets, that we'll need to join together. 
#
# Unfortunately, the two datasets store the county name in fields that are named differently,
# and worse, the State information is saved two different ways (abbreviation or whole name)
#
# So you'll need to join three datasets together to get everything lined up in
# one combined dataframe.
#
# ------------------------------------------------------------------------------

# Start with food_df, and first join it with state_name_abv_df so that you have
# the distance info and the state abbreviations. Then join it with the county_df
# so that you also get the urban/rural values. Save the final dataframe as `combined_df`
#
# Some hints: There are several ways to do this, but some things you can try:
# - use left_join(), and then see if the info in the new columns is NULL (didn't match) or not
# - make a new column (the same as an old one, but with a different name), using mutate
# - when you join, if both dataframes have the same column name, then use by = "col_name",
#   and if they have different column names, then use by = c("col_name1", "col_name2")
#   (where you put in the actual column names instead of my fae ones)
combined_df <- food_df %>%
  left_join(state_name_abv_df, by = c("State" = "State.Name")) %>%
  left_join(county_df, by = c("County" = "County_name", "State.Code" = "State"))

# Combined Analysis --------------------------------------------------------
#
# Now that we have urban/rural information along with food access information,
# we will do some analysis on the combined information. 
#
# ------------------------------------------------------------------------------

# How many total people live in food deserts? 
#
# First, whether someone is in a food dessert or not depends on whether their county,
# is rural or urban. So create separate dataframes for those counties: `rural_df`
# and `urban_df`
rural_df <- combined_df %>%
  filter(Metro.nonmetro.status == 0)

urban_df <- combined_df %>%
  filter(Metro.nonmetro.status == 1)

# Then count how many people in each of those sets of counties live in food desserts.
# Store the total number of people who live in food deserts in the variable named `total_fd_pop`.
total_fd_pop <- sum(rural_df$Low.Access.Numbers.People.10.Miles) + sum(urban_df$Low.Access.Numbers.People.1.Mile)

# What percent of the US total population live in food deserts? Round your answer
# to the nearest whole number are store in a variable named `total_fd_per`
total_fd_per <- round(total_fd_pop / sum(combined_df$Population) * 100)
print(total_fd_per)

# What percent of people in rural counties live in food desserts?  Round your answer
# to the nearest whole number are store in a variable named `total_rural_fd_per`
total_rural_fd_per <- round(sum(rural_df$Low.Access.Numbers.People.10.Miles) / sum(rural_df$Population) * 100)
print(total_rural_fd_per)

# What percentage of people in urban counties live in food desserts? Round your answer
# to the nearest whole number are store in a variable named `total_urban_fd_per`
total_urban_fd_per <- round(sum(urban_df$Low.Access.Numbers.People.1.Mile) / sum(urban_df$Population) * 100)
print(total_urban_fd_per)

# How many Children in total live in food deserts? (Remember, you have to count 
# separately for urban and rural counties). Store your answer in a variable 
# named `child_fd_pop`
child_fd_pop <- sum(rural_df$Low.Access.Numbers.Children.10.Miles) + sum(urban_df$Low.Access.Numbers.Children.1.Mile)

# What percent of people living in food deserts are children? Round to the
# nearest whole number and store in a variable called `child_fd_per`
child_fd_per <- round(child_fd_pop / total_fd_pop * 100)
print(child_fd_per)

# How many people who are low income live in food deserts? (Remember, you have to count 
# separately for urban and rural counties). Store your answer in 
# a variable named `LI_fd_pop`
LI_fd_pop <- sum(rural_df$Low.Access.Numbers.Low.Income.People.10.Miles) + sum(urban_df$Low.Access.Numbers.Low.Income.People.1.Mile)

# What percent of people living in food deserts are low income? Round to the
# nearest whole number and store in a variable called `LI_fd_per`
LI_fd_per <- round(LI_fd_pop / total_fd_pop * 100)
print(LI_fd_per)

# Add a column to rural_df called `fd_percent` with what percentage of people who 
# live in that county that are at least 10 miles from a grocery store. DO NOT ROUND
rural_df <- rural_df %>%
  mutate(fd_percent = Low.Access.Numbers.People.10.Miles / Population * 100)

# Make a new dataframe with all RURAL counties that have a MAX fd_percent value
# then order it by Population (descending), and select only the County, 
# State Name, Population, and fd_percent columns. Save the dataframe as `rural_county_max_fd_df`
rural_county_max_fd_df <- rural_df %>%
  filter(fd_percent == max(fd_percent)) %>%
  arrange(desc(Population)) %>%
  select(County, State, Population, fd_percent)

# Make a new dataframe with all RURAL counties that have a MIN fd_percent value
# then order it by Population (descending), and select only the County, 
# State Name, Population, and fd_percent columns.  Save the dataframe as `rural_county_min_fd_df`
rural_county_min_fd_df <- rural_df %>%
  filter(fd_percent == min(fd_percent)) %>%
  arrange(desc(Population)) %>%
  select(County, State, Population, fd_percent)

# Examine those two dataframes. What did you observe? Do you find anything surprising
# or do you find things matching your expectations?
# Save your answer as text saved into a variable called `rural_county_observations`
rural_county_observations <- "The Rural County Mins dataframe has a much larger population than expected compared to the Rural Max dataframe, and the FD percent for Min is 0, while the FD percent for Max is 100, which is surprising."


# Add a column to urban_df called `fd_percent` with what percentage of people who 
# live in that county that are at least 1 mile from a grocery store. DO NOT ROUND
urban_df <- urban_df %>%
  mutate(fd_percent = Low.Access.Numbers.People.1.Mile / Population * 100)

# Make a new dataframe with all URBAN counties that have a MAX fd_percent value
# then order it by Population (descending), and select only the County, 
# State Name, Population, and fd_percent columns. Save the dataframe as `urban_county_max_fd_df`
urban_county_max_fd_df <- urban_df %>%
  filter(fd_percent == max(fd_percent)) %>%
  arrange(desc(Population)) %>%
  select(County, State, Population, fd_percent)

# Make a new dataframe with all URBAN counties that have a MIN fd_percent value
# then order it by Population (descending), and select only the County, 
# State Name, Population, and fd_percent columns. Save the dataframe as `urban_county_min_fd_df`
urban_county_min_fd_df <- urban_df %>%
  filter(fd_percent == min(fd_percent)) %>%
  arrange(desc(Population)) %>%
  select(County, State, Population, fd_percent)

# Examine those two dataframes. What did you observe? Do you find anything surprising
# or do you find things matching your expectations?
# Save your answer as text saved into a variable called `urban_county_observations`
urban_county_observations <- "The Urban County Min dataframe has fewer cells compared to the Urban County Max dataframe, and it only contains information for the state of Virginia."


#To run the test file, uncomment the line below before running source. 
test_file("hw3_test.R")