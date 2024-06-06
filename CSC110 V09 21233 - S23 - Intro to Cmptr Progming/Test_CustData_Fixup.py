# Markell Thornton
# 5/27/2023

import unittest
import proj7

class TestProj7(unittest.TestCase):

    def test_fixCustNum(self):
        self.assertEqual(105316, proj7.fixCustNum('1O5316'))
        self.assertEqual(105316, proj7.fixCustNum('l 05316'))
        self.assertEqual(105316, proj7.fixCustNum(' lO5316 '))
        self.assertEqual(105316, proj7.fixCustNum('1 053l6'))


    def test_fixCustName(self):
        self.assertEqual(('Lopez', 'Lupe Luisa'), proj7.fixCustName(' Lopez,Lupe Luisa '))
        self.assertEqual(('Burak', 'Ertan'), proj7.fixCustName(' Burak,Ertan '))
        self.assertEqual(('Daniel', 'Tschernikow'), proj7.fixCustName(' Daniel,Tschernikow '))
        self.assertEqual(('Vieagus', 'Ortega'), proj7.fixCustName('Vieagus,Ortega'))

    def test_fixCustPhone(self):
        self.assertEqual(('206', '5551845'), proj7.fixCustPhone(' (206) 555-1845 '))
        self.assertEqual(('123', '4567890'), proj7.fixCustPhone(' 123-456-7890 '))
        self.assertEqual(('555', '1234567'), proj7.fixCustPhone(' (555)123-4567 '))
        self.assertEqual(('987', '6543210'), proj7.fixCustPhone('(987)654-3210'))

    def test_fixCustBalance(self):
        self.assertEqual(1346.75, proj7.fixCustBalance(' $1,346.75 '))
        self.assertEqual(25000.50, proj7.fixCustBalance(' $25,000.50 '))
        self.assertEqual(777.99, proj7.fixCustBalance(' $777.99 '))
        self.assertEqual(5000.22, proj7.fixCustBalance('$5,000.22'))

if __name__ == '__main__':
    unittest.main()
