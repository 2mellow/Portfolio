#Markell Thornton
#5/16/2023

import unittest
import proj5

class TestRating(unittest.TestCase):


    
    def test_rateAthletic(self):
        self.assertEqual(0.7,proj5.rate(7,4))

    def test_rateFoodOut(self):
        self.assertEqual(0.4,proj5.rate(10,5))

    def test_rateEntertaimentOut(self):
        self.assertEqual(0.7,proj5.rate(8,6))

    def test_rateSeriusRelationship(self):
        self.assertEqual(1,proj5.rate(9,10))

    def test_match(self):
        person1 = (7, 10, 8, 9, 10, "buddhism",6, 8)
        person2 = (4, 5, 6, 10, 8, "judaism", 3, 2)
        self.assertAlmostEqual(0.69,proj5.match(person1,person2),2)
    
def main():
    suite = unittest.TestLoader().loadTestsFromTestCase(TestRating)
    unittest.TextTestRunner(verbosity=2).run(suite)    

main()

