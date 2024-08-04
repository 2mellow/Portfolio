#Markell Thornton
#5/21/2023




def enterCo2ReadingBatch():
    name = getNonEmptyString('Enter your name: ')
    location = getNonEmptyString('Enter your location: ')
    total = 0
    min_level = 10001
    max_level = 0
    count = 0

    month = getInRangeInteger('Enter month (or 0 to exit): ', 0, 12)

    while month != 0:
        day = getInRangeInteger('Enter day: ', 1, 31)
        year = getInRangeInteger('Enter year: ', 2022, 2099)
        co2_level = getInRangeInteger('Enter CO2: ', 1, 10000)

        if co2_level < min_level:
            min_level = co2_level
        if co2_level > max_level:
            max_level = co2_level

        total += co2_level
        count += 1

        month = getInRangeInteger('Enter month (or 0 to exit): ', 0, 12)

    if count == 0:
        avg_level = 0
    else:
        avg_level = total / count

    return name, location, min_level, max_level, count, avg_level





def getInRangeInteger(prompt, min_value, max_value):
    invalid_input = True
    

    while invalid_input:
        
        value = int(input(prompt))
        if value < min_value or value > max_value:
            print("Invalid input. Please enter a valid integer between {} and {}.".format(min_value, max_value))
        else:
            invalid_input = False

    return value

def getNonEmptyString(prompt):
    is_empty = True
    value = None

    while is_empty:
        value = input(prompt)
        if value:
            is_empty = False
        else:
            print('Input cannot be empty. Please try again.')

    return value
 
def main():
    name, location, min_L, max_L, reading_count, avg_L = enterCo2ReadingBatch()
    line = '-' * 50
    print()
    print(line)
    print('Recorder name: ' + name)
    print('Reading location: ' + location)
    print()
    print('Number of readings: ' + str(reading_count))
    print('Minumum CO2 level: ' + str(min_L))
    print('Maximum CO2 level: ' + str(max_L))
    print('Average CO2 level: ' + str(avg_L))
    print(line)


main()

# The one place where I got stuck for the longest time would be when the program woulddn't shut down when I pressed 0 for the month instead it would either keep going, or break.
# I mostly just tried many methods of getting my program to stop when I hit 0 even break.
# Something that I learned this project is that I could have saved a lot of time if I just set up a sentinel while month != 0
