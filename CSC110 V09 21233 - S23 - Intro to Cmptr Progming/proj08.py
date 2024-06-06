# Markell Thornton
# 6/4/2023
# Description: This program reads data from a text file containing river pollution data and creates a summary report based on user input.

def process_pollution_data():
    # Get user input for river, month, and pollutant
    river = input("Which river? ")
    while river == "":
        print("River name must not be empty.")
        river = input("Which river? ")

    # Checks user input and gives a value error if false
    month = None
    while month is None:
        try:
            month = int(input("Which month (e.g., 1 for January)? "))
            if not (1 <= month <= 12):
                raise ValueError
        except ValueError:
            print("Month number must be an integer between 1 and 12, inclusive.")
            month = None

    # Dictionary mapping pollutant codes to names
    pollutants = {
        1: "Arsenic",
        2: "Lead",
        3: "Fertilizer",
        4: "Pesticides"
    }

    # Print available pollutants
    print()
    print("Available pollutants:")
    for code, name in pollutants.items():
        print("{}. {}".format(code, name))


    pollutant = None
    while pollutant is None:
        try:
            pollutant = int(input("Which pollutant? "))
            if pollutant not in pollutants:
                raise ValueError
        except ValueError:
            print("Invalid pollutant number.")
            pollutant = None

    # Get pollutant name from user input
    pollutant_name = pollutants.get(pollutant)

    # Get pollutant name from user input
    pollutant_name = pollutants.get(pollutant)

    # File processing
    filename = "RiverPollutionData.txt"
    try:
        with open(filename, 'r') as file:
            # Open file
            summary_file = open("PollutionSummary.txt", 'w')

            # Initialize variables for calculations
            readings_count = 0
            total_readings = 0
            lowest_reading = float('inf')
            highest_reading = float('-inf')

            # Process each line in the file
            line_num = 1
            for line in file:
                if line_num > 1:
                    # Split the line into individual data
                    data = line.split("\t")
                    line_river = data[0]
                    line_month = int(data[1])
                    reading = float(data[2 + pollutant])

                    # Check if the data matches user input
                    if line_river == river and line_month == month:
                        # Update calculations
                        readings_count += 1
                        total_readings += reading
                        lowest_reading = min(lowest_reading, reading)
                        highest_reading = max(highest_reading, reading)

                line_num += 1

            # Calculate average reading
            average_reading = total_readings / readings_count

            # Write the summary to the file
            summary_file.write("Data for river:\t{}\n".format(river))
            summary_file.write("Data for month:\t{}\n".format(month))
            summary_file.write("Data for pollutant:\t{}\n".format(pollutant_name))
            summary_file.write("Number of readings:\t{}\n".format(readings_count))
            summary_file.write("Average of readings:\t{}\n".format(average_reading))
            summary_file.write("Lowest reading:\t{}\n".format(lowest_reading))
            summary_file.write("Highest reading:\t{}\n".format(highest_reading))

            # Close file
            summary_file.close()

            # Completion message
            print("\nProcessing of {} rows is complete. See summary file for results.".format(readings_count))

    except FileNotFoundError:
        print("File not found.")


def main():
    process_pollution_data()


main()


# Using Lab08, this project felt straightforward. During debugging, I encountered an issue with the indexing, which caused the program to indicate that it only read through the file once.
# To address this problem, I added multiple print statements throughout the code to identify areas with error messages. This approach proved effective, and it was my first time implementing it.
# This assignment was relatively straightforward after completing the lab since it built upon concepts from the previous project. To be fair, value errors would have been new if I hadn't made one project overly complex.
