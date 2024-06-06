# Markell Thornton
# 6/10/2023
# This program organizes a list of words from a file and writes them to a separate file, sorted by their length and frequency.

def readFile(file_name):
    # Reads the contents of the file
    with open(file_name, 'r') as file:
        content = file.read()
    # Splits the content into individual words 
    words = content.split()
    return words

def findLongest(words):
    # Finds the longest word in the list
    if words:
        longest_word = max(words, key=len)
        return longest_word, len(longest_word)
    else:
        return None, 0

def generateSortedList(words):
    # Creates a list of sorted words
    sorted_words = sorted(set(words))
    return sorted_words

def writeWordFile(file_name, words_list):
    # Writes words to a file, each on a separate line
    with open(file_name, 'w') as file:
        file.write('\n'.join(words_list))

def generateLenFreqs(words, max_length):
    # Creates a list of words based on their lengths
    word_freqs = [0] * (max_length + 1)
    for word in words:
        length = len(word)
        word_freqs[length] += 1
    return word_freqs

def main():
    # Defines the file input
    file_name = 'GettysburgAddress.txt'
    words = readFile(file_name)
    distinct_words = generateSortedList(words)
    longest_word, longest_word_length = findLongest(words)
    # Places sorted words into a separate file
    writeWordFile('GettysburgWords.txt', distinct_words)
    word_freqs = generateLenFreqs(distinct_words, longest_word_length)

    # Display the results
    print('Number of distinct words: ', format(len(distinct_words), '4.0f'))
    print('Length of longest word: ', format(longest_word_length, '6.0f'))
    print('Longest word: ', longest_word, '\n')
    for num in range(1, longest_word_length + 1):
        print('Length =', format(num, '3.0f'), ',', 'Count = ', format(word_freqs[num], '2.0f'))

if __name__ == '__main__':
    main()

# The challenge of this project was figuring out why a number was being measured at a count of 60, which was caused by an issue in the 'generateLenFreqs' function and a duplicate word variable. 
# We had lots of practice with file (I/O), Testing mainly involved commenting out specific sections and adjusting formatting issues such as '1.0f.2.0f'. I began counting down from '5.0f'.
# During this project, we learned how to organize words based on their length and place them into a separate file. we also learned about lists and sets, understanding when to use a list instead of a sets.
