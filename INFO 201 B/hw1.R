# A1 core skills

# Delete all variables in your workspace. This will make it easier to test your script.
rm(list = ls())

# Set up and Defining variables ------------------------------------------------

# Load the the `stringr` package 
# (you'll need to install it if you haven't used it before)
# It has a variety of functions that make working with string variables easier

install.packages("stringr")
library(stringr)

# Create a numeric variable `my_age` that is equal to your age

my_age <- as.numeric(25)

# Create a variable `my_name` that is equal to your first name

my_name <- "Markell"

# Using multiplication, create a variable `minutes_in_a_day` that is
# equal to the number of minutes in a day

minutes_in_an_hour <- 60
hours_in_a_day <- 24

minutes_in_a_day <- hours_in_a_day * minutes_in_an_hour

# Using multiplication, create a variable `hours_in_a_year` that is
# equal to the number of hours in a year

days_in_a_year <- 365
hours_in_a_day <- 24

hours_in_a_year <- days_in_a_year * hours_in_a_day

# Create a variable `more_minutes_than_hours` that is boolean (TRUE/FALSE)
# It should be TRUE if there are more minutes/day than hours/year
# Otherwise it should be FALSE (use a comparison operator to calculate this)

minutes_in_an_hour <- 60
hours_in_a_day <- 24
days_in_a_year <- 365
hours_in_a_year <- days_in_a_year * hours_in_a_day

minutes_in_a_day <- hours_in_a_day * minutes_in_an_hour

more_minutes_than_hours <- minutes_in_a_day > hours_in_a_year


# Working with functions -------------------------------------------------------

# Write a function `make_introduction()` that takes in two args (`name`, `age`) 
# This function should return a string value that says:
# "Hello, my name is {name}, and I'm {age} years old."
# The values {name} and {age} should take on the values passed into the function 
# Make sure that proper spacing is used (e.g., you shouldn't have multiple
# spaces between words, and you should have a space after a comma)
# Hint: google search for "R paste paste0 difference" 
#       Try reading a few pages to understand how to use each

make_introduction <- function(name, age) {
  introduction <- paste("Hello, my name is", name, "and I'm", age, "years old.")
  return(introduction)
}

name <- "Markell"
age <- 25

result <- make_introduction(name, age)
print(result)

# Create a variable `my_intro` by passing your variables `my_name` and `my_age`
# into your `make_introduction()` function

my_name <- "Mellow"
my_age <- 25
my_intro <- make_introduction(my_name, my_age)

# Create a variable `casual_intro` by substituting "Hello, my name is ",
# with "Hey, I'm" in your `my_intro` variable

casual_intro <- gsub("Hello, my name is ", "Hey, I'm ", my_intro)

# Create a variable `loud_intro`, which is `my_intro` in all upper-case letters
# You should do this by using a function to convert your `my_intro` variable 
# into all capital letters.

loud_intro <- toupper(my_intro)

# Create a variable `quiet_intro`, which is `my_intro` in all lower-case letters
# You should do this by using a function to convert your `my_intro` variable 
# into all lower-case letters.

quiet_intro <- tolower(my_intro)

# Create a new variable `capitalized_intro`, which is your `my_intro` variable, 
# but with each word capitalized. hint: google the stringr function `str_to_title`

capitalized_intro <- str_to_title(my_intro)

# Using the `str_count` function, create a variable `occurrences` that stores
# the # of times the letter "e" appears in `my_intro`

occurrences <- str_count(my_intro, "e")

# Write a function `double()` that takes in a value and
# returns that value times two

double <- function(value) {
  result <- value * 2
  return(result)
}

value <- 5
result <- double(value)
print(result)

# Using your `double()` function, create a variable `minutes_in_two_days`,
# which is the number of minutes in two days

minutes_in_an_hour <- 60
hours_in_a_day <- 24
minutes_in_a_day <- hours_in_a_day * minutes_in_an_hour

minutes_in_two_days <- double(minutes_in_a_day)

print(minutes_in_two_days)

# Write a function `cube()` that takes in a value and returns that value cubed

cube <- function(value) {
  result <- value^3
  return(result)
}

value <- 2
result <- cube(value)
print(result)

# Create a variable `twenty_seven` by passing 3 to your `cube()` function

twenty_seven <- cube(3)

print(twenty_seven)

# Create a function `inches_to_cm` that converts from inches to centimeters

inches_to_cm <- function(inches) {
  cm_per_inch <- 2.54
  result <- inches * cm_per_inch
  return(result)
}

inches <- 10
cm_result <- inches_to_cm(inches)
print(cm_result)

# Create a variable `inches_tall` that is your (numeric) height in inches

inches_tall <- 70

# Using your `inches_to_cm` function and your `inches_tall` variable, 
# create a variable `cm_tall` that is your height in centimeters

cm_tall <- inches_to_cm(inches_tall)

# Write a function `has_more_zs` to determine which of two strings contains 
# more instances of the letter "z". It should take as parameters two string
# variables, and return the argument which has more occurances of the letter "z"
# If neither phrase contains the letter "z", it should return:
# "Neither string contains the letter z."
# If the phrases contain the same number of "z"s, it should return:
# "The strings have the same number of Zs." 
# The function must work for both capital and lowercase "z"s. 
#
# (hint: try googling "stringr count occurances")

has_more_zs <- function(str1, str2) {
  count_z_str1 <- str_count(tolower(str1), "z")
  count_z_str2 <- str_count(tolower(str2), "z")
  
  if (count_z_str1 == 0 & count_z_str2 == 0) {
    return("Neither string contains the letter z")
  } else if (count_z_str1 == count_z_str2) {
    return("The strings have the same number of Zs.")
  } else if (count_z_str1 > count_z_str2) {
    return(str1)
  } else {
    return(str2)
  }
}

# Create a variable `more_zs` by passing two strings of your choice to your
# `has_more_zs` function

string1 <- "Zoo"
string2 <- "amazing"

more_zs <- has_more_zs(string1, string2)

print(more_zs)

# Write a function `remove_digits` that will remove all digits
# (i.e., 0 through 9) from all elements in a *vector of strings*.

remove_digits <- function(string_vector) {
  result <- gsub("[0-9]", "", string_vector)
  return(result)
}

# Demonstrate that your approach is successful by passing a vector of courses
# to your function. For example, remove_digits(c("INFO 201", "CSE 142"))

courses_vector <- c("INFO 201", "CSE 142")

result <- remove_digits(courses_vector)
print(result)

# Vectors ----------------------------------------------------------------------

# Create a vector `movies` that contains the names of six movies you like

movies <- c("Inception", "The Shawshank Redemption", "Pulp Fiction", "The Dark Knight", "Forrest Gump", "The Matrix")

# Create a vector `top_three` that only contains the first three movies
# You should do this by subsetting the vector, not by simply retyping the movies

top_three <- movies[1:3]

# Using your vector and the `paste()` method, create a vector `excited` that
# adds the phrase - " is a great movie!" to the end of each element `movies`

excited <- paste(movies, " is a great movie!")

# Create a vector `without_four` by omitting the fourth element from `movies`
# You should do this using a _negative index_ 

without_four <- movies[-4]

# Create a vector `multiples_of_4` that is every number divisible by 4 
# between 4 and 400 (**2 points**) (hint google "r mod divisible")

multiples_of_4 <- (4:400)[(4:400) %% 4 == 0]

# Create a vector `multiples_of_8` by filtering your `multiples_of_4` variable 
# down to only elements that are divisible by 8.

multiples_of_8 <- multiples_of_4[multiples_of_4 %% 8 == 0]

# Create a vector `numbers` that is the numbers 700 through 999

numbers <- 700:999

# Using the built in `length()` function, create a variable `numbers_len`
# that is equal to the length of your vector `numbers`

numbers_len <- length(numbers)

# Using the `mean()` function, create a variable `numbers_mean` that is
# equal to the mean of your vector `numbers`

numbers_mean <- mean(numbers)

# Using the `median()` function, create a variable `numbers_median`
# that is the median of your vector `numbers`

numbers_median <- median(numbers)

# Create a vector `lower_numbers` that the values in your `numbers` vector
# that are lower than `numbers_mean` (you should do this using vector filtering)

lower_numbers <- numbers[numbers < numbers_mean]

# Create a vector `higher_numbers` that the values in your `numbers` vector
# that are higher than `numbers_mean` (again, using vector filtering)

higher_numbers <- numbers[numbers > numbers_mean]
