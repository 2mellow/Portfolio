import unittest
import os
from proj9 import readFile, findLongest, generateSortedList, generateLenFreqs, writeWordFile

class FindLongestTestCase(unittest.TestCase):

    def test_readFile(self):
        file_name = 'Hello.txt'
        with open(file_name, 'w') as file:
            file.write('Hello')
        result = readFile(file_name)
        self.assertEqual(result, ['Hello'])

        file_name = 'Hello Hello.txt'
        with open(file_name, 'w') as file:
            file.write('Hello\nHello')

        result = readFile(file_name)
        self.assertEqual(result, ['Hello', 'Hello'])


        file_name = 'empty file.txt'
        result = readFile(file_name)
        with open(file_name, 'w') as file:
            pass
        result = readFile(file_name)
        self.assertEqual(result, [])

        file_name ='duplicate word.txt'
        
    def test_findLongest(self):
        words = []
        result = findLongest(words)
        self.assertEqual(result, (None, 0))

        words = ['ago']
        result = findLongest(words)
        self.assertEqual(result, ('ago', 3))

        words = ['ago', 'proposition', 'consecrated']
        result = findLongest(words)
        self.assertEqual(result, ('proposition', 11))

        words = ['a' * i for i in range(1, 10001)]
        result = findLongest(words)
        self.assertEqual(result, ('a' * 10000, 10000))
    
    def test_generateSortedList(self):
        words = []
        result = generateSortedList(words)
        self.assertEqual(result, [])

        words = ['ago', 'so', 'proposition', 'consecrated']
        expected_result = ['ago', 'consecrated', 'proposition', 'so']
        result = generateSortedList(words)
        self.assertEqual(result, expected_result)

    def test_writeWordFile(self):
        file_name = 'smallwords.txt'
        words_list = ['is', 'this', 'real']
        writeWordFile(file_name, words_list)
        self.assertTrue(os.path.exists(file_name))
        with open(file_name, 'r') as file:
            content = file.read()
            expected_content = 'is\nthis\nreal' 
            self.assertEqual(content, expected_content)
        os.remove(file_name)

    def test_generateLenFreqs(self):
        words = []
        max_length = 0
        result = generateLenFreqs(words, max_length)
        self.assertEqual(result, [0])

        words = ['ago', 'so', 'consecrated', 'proposition']
        max_length = 12
        expected_result = [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 2, 0]
        result = generateLenFreqs(words, max_length)
        self.assertEqual(result, expected_result)

if __name__ == '__main__':
    unittest.main()
