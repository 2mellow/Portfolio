def process_numbers():
    filename = input("Enter the name of the text file: ")
    try:
        with open(filename, 'r') as file:
            even_file = open("even.txt", 'w')
            odd_file = open("odd.txt", 'w')
            positive_sum = 0
            negative_count = 0

            for line in file:
                number = int(line.strip())
                
                if number % 2 == 0:
                    even_file.write(line)
                else:
                    odd_file.write(line)
                
                if number >= 0:
                    positive_sum += number
                else:
                    negative_count += 1
                    
            even_file.close()
            odd_file.close()
            
            print("Even numbers have been written to even.txt")
            print("Odd numbers have been written to odd.txt")
            print("Sum of positive numbers:", positive_sum)
            print("Count of negative numbers:", negative_count)
    except FileNotFoundError:
        print("File not found.")

process_numbers()

