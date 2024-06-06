# Lab 3 starter code
# CSC 110
#Markell Thornton

import math

def main():
    print("This program is to test functions")
    # put your function calls here
    print("base1\tbase2\theight\tarea")
    print("4\t5\t8\t" + str(areaTrapezoid(4,5,8)))
    print("2\t7\t9\t" + str(areaTrapezoid(2,7,9)))
    print(pythagorean(3,4))
def pythagorean(a, b):

    c= math.sqrt(a**2 + b**2) 

    return c
    
  

# This function calculates and returns the area of a trapezoid
# parameter: base1, the length of the top of the trapezoid
# parameter: base2, the length of the bottom
# parameter: height, the height of the trapezoid
# See this website for a picture  http://math.com/tables/geometry/areas.htm
def areaTrapezoid(base1, base2, height):
    area = height / 2.0 * (base1 + base2)
    return area



main()
