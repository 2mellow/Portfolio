# Markell Thornton
# 5/27/2023
# This program processes customer information by using 'fix' functions to separate variables and correct mistakes, such as differentiating between the characters '1' and 'l' or '0' and 'O'.

def fixCustNum(badCustNum):
    # Replaces 'O' with '0', 'l' (ell) with '1', and removes spaces in the customer number.
    goodCustNum = int(badCustNum.replace('O', '0').replace('l', '1').replace(' ', ''))
    return goodCustNum

def fixCustName(badCustName):
    # Removes white spaces, splits name into last and first name using a comma. 
    badCustName = badCustName.strip()
    lastName, firstName = badCustName.split(',')
    firstName = ' '.join(firstName.split())
    return lastName, firstName

def fixCustPhone(badCustPhone):
    # Remove parentheses, dashes, and spaces.
    badCustPhone = badCustPhone.replace('(', '').replace(')', '').replace('-', '').replace(' ', '')
    areaCode = badCustPhone[:3]
    phoneNumber = badCustPhone[3:]
    return areaCode, phoneNumber

def fixCustBalance(badCustBalance):
    # Remove dollar sign and commas, and convert to a float.
    goodCustBalance = float(badCustBalance.replace('$', '').replace(',', ''))
    return goodCustBalance

def main():
    # Input
    userInput = input('Enter customer string: ')

    # Processes information from the functions and seperates the variables. 
    custInfo = userInput.split('#')
    custNum = fixCustNum(custInfo[0])
    custName = fixCustName(custInfo[1])
    custPhone = fixCustPhone(custInfo[2])
    custBalance = fixCustBalance(custInfo[3])

    # Output
    print()
    print("Customer number     :", custNum)
    print("Customer last name  :", custName[0])
    print("Customer first name :", custName[1])
    print("Customer area code  :", custPhone[0])
    print("Customer phone      :", custPhone[1])
    print("Customer balance    :", custBalance)

main()

# What I found to be the most difficult was debugging the code. I had a bad bug that would mistake integers for strings. It required rearranging the order of two lines of code and removing one.
# Some tests that I ran included inserting multiple spaces between characters in the problematic string, replacing 'O' with '0', and verifying if my code correctly removed parentheses, dashes, and dollar signs.
# I learned about splitting strings into chunks and processing them through multiple functions, which is a fascinating concept.


