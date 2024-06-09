#Markell Thornton
#Markell2@uw.edu
#Collaboration statement goes here

# Delete all variables in your workspace. This will make it easier to test your script.
rm(list = ls())

#all library statements must be at the top of the page!
library(dplyr)
library(stringr)
library(ggplot2)
library(plotly)

#libraries for testing. Make sure they are installed with
# install.packages("testthat")
library(testthat)

# Overview ---------------------------------------------------------------------

# Homework 4: Climate Change Analysis

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

country_df <- read.csv("country_data.csv") #DO NOT CHANGE!
geo_df <- read.csv("geographies.csv") #DO NOT CHANGE!


# Carbon footprints of example countries----------------------------------------
#
# We will choose some example countries and look at the carbon footprints 
# percapita from those countries. We will make plots to do this investigation.
#
# ------------------------------------------------------------------------------

# Before we continue any further, first remove all rows that have NA values for
# Carbon_Footprint_percapita. Resave this smaller dataframe as country_df.
country_df <- country_df %>%
  filter(!is.na(Carbon_Footprint_percapita))

# Let's look at the USA first. Make a dataframe called `us_df` which has only
# the data for the USA.
us_df <- country_df %>%
  filter(country == "United States")

# Now make a line plot of the USA data with Year on the x axis and Carbon footprint
# percapita on the y axis. Save it in a variable called `us_plot`.
# Note: you can add a line of code after that is just `us_plot` to display the plot
us_plot <- ggplot(us_df, aes(x = Year, y = Carbon_Footprint_percapita)) +
  geom_line(color = "green") +
  labs(title = "Carbon Footprint per Capita in the USA",
       x = "Year",
       y = "Carbon Footprint per Capita")

us_plot

# Now let's compare fourn countries: USA, China, Canada, and Brazil. Make a dataframe 
# called `four_countries_df` which has only the data for these for countries.
#
# Hint: You can use `country %in% c(...)` with the country names in the c() 
four_countries_df <- country_df %>%
  filter(country %in% c("United States", "China", "Canada", "Brazil"))

# Now make a line plot of the four country data with Year on the x axis and Carbon footprint
# percapita on the y axis. Save it in a variable called `four_countries_plot`.
# Note: you can add a line of code after that is just `four_countries_plot` to display the plot
four_countries_plot <- ggplot(four_countries_df, aes(x = Year, y = Carbon_Footprint_percapita, color = country)) +
  geom_line() +
  labs(title = "Carbon Footprint per Capita Comparison",
       x = "Year",
       y = "Carbon Footprint per Capita",
       color = "Country")

four_countries_plot

# Make another version of the four_countries_plot, but this time add labels, so that
# the title is "Comparing Carbon footprint per capita in four countries", the
# x axis is labeled as "Year", the y axis is labeled as "Carbon Footprint per Capita"
# and the color is labeled as "Country"
# Save it in a variable called `four_countries_labeled_plot`
# Note: you can add a line of code after that is just `four_countries_labeled_plot` to display the plot
# 
# Hint: use the ggplot2 labs() function
four_countries_labeled_plot <- ggplot(four_countries_df, aes(x = Year, y = Carbon_Footprint_percapita, color = country)) +
  geom_line() +
  labs(title = "Comparing Carbon Footprint per Capita in Four Countries",
       x = "Year",
       y = "Carbon Footprint per Capita",
       color = "Country")

four_countries_labeled_plot

# Now take your four_countries_labeled_plot and make it interactive by using the
# ggplotly function and save it in a variable called `four_countries_interactive_plot`
# Note: you can add a line of code after that is just `four_countries_interactive_plot` to display the plot
four_countries_interactive_plot <- ggplotly(four_countries_labeled_plot)
four_countries_interactive_plot

# NOTE: We wont worry about making these nicely formatted labels for the rest of this assignment

# Carbon footprints In Year 2000 -----------------------------------------------
#
# We now look at carbon footprints per capita from the year 2000. 
# We will make plots to do this investigation.
#
# ------------------------------------------------------------------------------

# Make a dataframe of just the country_df data from the year 2000. Save it in 
# a variable called `country_2000_df`
country_2000_df <- country_df %>%
  filter(Year == 2000)

# Now make an interactive scatter plot (using ggplot and ggplotly) from the country_2000_df
# data, with the x axis set to median_income_perhousehold, and the y axis set to
# Carbon_Footprint_percapita.
scatter_plot_2000 <- ggplot(country_2000_df, aes(x = median_income_perhousehold, y = Carbon_Footprint_percapita)) +
  geom_point(color = "red") +
  labs(title = "Scatter Plot of Carbon Footprint per Capita vs Median Income (Year 2000)",
       x = "Median Income per Household",
       y = "Carbon Footprint per Capita")

interactive_scatter_plot_2000 <- ggplotly(scatter_plot_2000)
interactive_scatter_plot_2000

# Additionally set the point's "text" as the country name. Then when using
# the ggplotly function, set the tooltip to be "text" so that when you hover over
# a point, you see the country name
scatter_plot_2000 <- ggplot(country_2000_df, aes(x = median_income_perhousehold, y = Carbon_Footprint_percapita, text = country)) +
  geom_point(color = "blue") +
  labs(title = "Scatter Plot of Carbon Footprint per Capita vs Median Income (Year 2000)",
       x = "Median Income per Household",
       y = "Carbon Footprint per Capita")

interactive_scatter_plot_2000 <- ggplotly(scatter_plot_2000, tooltip = "text")
interactive_scatter_plot_2000

# Save it in a variable called `y2k_plot`
# Note: you can add a line of code after that is just `y2k_plot` to display the plot
y2k_plot <- interactive_scatter_plot_2000
y2k_plot

# Look for the US on the plot. If you aren't able to find it, look at the dataframe and see
# if you can figure out why you don't see it. Write your observations in the string variable below
what_about_usa_observations <- "The carbon footprint per capita in the USA has decreased since 1980, with a peak of 28 carbon footprints per capita in 1980 and a current low of about 19 carbon footprints per capita in the year 2020."

# Data Joining ----------------------------------------------------------------
#
# Use a left_join to merge your country_df to the geo_df and store the combined
# dataframe into a variable `combined_df`. You need to join based on the names 
# of the countries (note: the columns have different names). 
# save the result in a dataframe called `combined_df`
#
# ------------------------------------------------------------------------------
combined_df <- left_join(country_df, geo_df, by = c("country" = "name"))


# Plotting Combined Data -----------------------------------------------
#
# We now look at carbon footprints per capita from the year 2000. 
# We will make plots to do this investigation.
#
# ------------------------------------------------------------------------------

# Now we are going to redo the year 2000 plot but with our additional data

# Make a dataframe of just the combined_df data from the year 2000. Save it in 
# a variable called `combined_2000_df`
combined_2000_df <- combined_df %>%
  filter(Year == 2000)

# Now make an interactive scatter plot (using ggplot and ggplotly) from the combined_2000_df
# data, with the x axis set to median_income_perhousehold, and the y axis set to
# Carbon_Footprint_percapita. ALSO: set the color to the "four_regions" value
scatter_plot_combined_2000 <- ggplot(combined_2000_df, aes(x = median_income_perhousehold, y = Carbon_Footprint_percapita, color = four_regions)) +
  geom_point() +
  labs(title = "Interactive Scatter Plot (Year 2000)",
       x = "Median Income per Household",
       y = "Carbon Footprint per Capita",
       color = "Region")

interactive_scatter_plot_combined_2000 <- ggplotly(scatter_plot_combined_2000)
interactive_scatter_plot_combined_2000

# Additionally set the point's "text" as the country name. Then when using
# the ggplotly function, set the tooltip to be "text" so that when you hover over
# a point, you see the country name
#
# Save it in a variable called `y2k_combined_plot`
# Note: you can add a line of code after that is just `y2k_combined_plot` to display the plot
scatter_plot_combined_2000 <- ggplot(combined_2000_df, aes(x = median_income_perhousehold, y = Carbon_Footprint_percapita, color = four_regions, text = country)) +
  geom_point() +
  labs(title = "Interactive Scatter Plot (Year 2000)",
       x = "Median Income per Household",
       y = "Carbon Footprint per Capita",
       color = "Region")


y2k_combined_plot <- ggplotly(scatter_plot_combined_2000, tooltip = "text")
y2k_combined_plot

# Now we are going to look at the different income groups

# Make a summary of each income group by using the group_by and summarize function
# Have those make a column called avg_Carbon_Footprint_percapita with the average 
# of all the Carbon_Footprint_percapita values in the group. Save it in a variable
# called `summary_df`
summary_df <- combined_df %>%
  group_by(income.groups) %>%
  summarize(avg_Carbon_Footprint_percapita = mean(Carbon_Footprint_percapita, na.rm = TRUE))

# Look at the US values in the dataframe and see if you think it will be counted
# when making this summary. Say if you think it will be used and why you think so
# in the string variable below.
is_us_in_summary_and_why <- "The average carbon footprint per capita by income group seems to be higher based on the amount of income. The high-income group emits the most, and the low-income group emits the least amount of carbon per capita.United States data isn't in the data plot."


# Now make an interactive bar chart (using ggplot and ggplotly) from your summary_df
# data, with the x axis as income group, the y axis as the avg_Carbon_Footprint_percapita
# and the fill color of the bars based on the income group
# Save it in a variable called `summary_plot`
# Note: you can add a line of code after that is just `summary_plot` to display the plot
summary_plot <- ggplot(summary_df, aes(x = income.groups, y = avg_Carbon_Footprint_percapita, fill = income.groups)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Carbon Footprint per Capita by Income Group",
       x = "Income Group",
       y = "Average Carbon Footprint per Capita") + theme_minimal()


summary_plot <- ggplotly(summary_plot)
summary_plot

#To run the test file, uncomment the line below before running source. 
test_file("hw4_test.r")

#NOTE: You will get warnings about things like the unkown aesthetic "text" value.
# Don't worry about that warning.

