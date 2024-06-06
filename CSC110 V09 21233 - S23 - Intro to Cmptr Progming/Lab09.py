# Markell Thornton
# 6/6/2023

userAge = -99

try:
    userInput = input("Enter your age: ")
    userAge = int(userInput)
except ValueError:
    pass

print("The value of userAge is:", userAge)
