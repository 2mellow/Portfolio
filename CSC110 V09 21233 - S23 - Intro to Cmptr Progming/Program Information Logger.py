#Markell Thornton
#4/252023

#define global variables
name = ""
date = ""
program_name = ""
description = ""
width = 70

def collectInputs():
    global name,date,program_name,description

    name = input("Enter your name: ")
    date = input("Enter the date: ")
    program_name = input("Enter the program name: ")
    description = input("Enter short description: ")

def displayBanner():
    displayStarLine()        
    print("#\tCoder\t:\t"+name)
    print("#\tDate\t:\t"+date)
    print("#\tProgram\t:\t"+program_name)
    print("#\tDescrip\t:\t"+description)
    displayStarLine()


def displayStarLine():
    print("#"+"*"*width)


def displaySectHeaders():
    displaySecHeader("Constants")
    print()
    displaySecHeader("Variables")
    print()
    displaySecHeader("Input")
    print()
    displaySecHeader("Processing")
    print()
    displaySecHeader("Output")
    

def displaySecHeader(section_name):
    displayStarLine()
    print("#\t\t" + section_name)
    displayStarLine()


def main():
    collectInputs()
    print()
    displayBanner()
    print()
    displaySectHeaders()



main()

# I honetsly have been super behind because of calculus. I had to review some work before starting this. Where I got stuck was the very first section. I didn't understand why my first function wasn't working. After figuring that out the project became pretty straight forward. 
# The thing is I didn't test my program. I was confused to why I ran it and only seen a blank box. Since main() was the last thing I wrote in the code nothing seemed to work other than the enter name,date descrip,so on. I quickly realized the issue and was relieved to see i was right on track. I was in the dark the whole time though. 
# The thing that i learned from this assignment was how to use functions. The other is that these will save a lot of time. It feels great learning about these because it simply changes existing codes that I've wrote and will be an amazing tool for upcoming projects. 
