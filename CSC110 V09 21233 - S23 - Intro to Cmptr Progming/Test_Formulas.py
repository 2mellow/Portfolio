import unittest
import formulas

class TestFormulas(unittest.TestCase):
    # Your test units
    def test_calcDistance(self):
        self.assertAlmostEqual(2.8284,formulas.calcDistance(1,2,3,4),4)

    def test_calcMidpoint(self):
        self.assertAlmostEqual((11.7000,9.8500),formulas.calcMidpoint(7.8,1.4,15.6,18.3),4)

    def test_calcRadius(self):
        self.assertAlmostEqual(6.0605,formulas.calcRadius(4.5,7.8,9.3,11.5),4)

def main():
    suite = unittest.TestLoader().loadTestsFromTestCase(TestFormulas)
    unittest.TextTestRunner(verbosity=2).run(suite)    

main()
