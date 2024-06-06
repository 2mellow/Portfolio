#Markell Thonton
#Date 4/29/2023

from math import sqrt

def doDistancePractice():
    global enter,distance,midpoint_x,midpoint_y,x1,y1,x2,y2
   
    displayBanner()
    print("\tDISTANCE PRACTICE")
    displayBanner()
    
    x1 = float(input("Enter x1:"))
    y1 = float(input("Enter y1:"))

    x2 = float(input("Enter x2:"))
    y2 = float(input("Enter y2:"))
    print("Distance = "+str(round(calcDistance(x1,y1,x2,y2),4)))
    
def calcDistance(x1,y1,x2,y2):

    distance = ((x2-x1) **2 + (y2-y1)** 2)**.5


    return(distance)


    
def displayBanner():
    print("----------------------------------------")



def doMidpointPractice():

    displayBanner()
    print("\tMIDPOINT PRACTICE")
    displayBanner()
    
    x1 = float(input("Enter x1:"))
    y1 = float(input("Enter y1:"))
    x2 = float(input("Enter x2:"))
    y2 = float(input("Enter y2:"))
    midpoint_x,midpoint_y =calcMidpoint(x1,y1,x2,y2)
    print("Midpoint x = "+str(round(midpoint_x,4)))
    print("Midpoint y = "+str(round(midpoint_y,4)))


     
def calcMidpoint(x1,y1,x2,y2):

    midpoint_x =(x1+x2) / 2

    midpoint_y = (y1+y2) /2

    return(midpoint_x,midpoint_y)

def doRadiusPractice():

    displayBanner()
    print("\tRADIUS PRACTICE")
    displayBanner()


    center_x= float(input("Enter center x:"))
    center_y= float(input("Enter center y:"))
    point_x = float(input("Enter point x:"))
    point_y = float(input("Enter point y:"))
    print("Radius = "+str(round(calcRadius(center_x,center_y,point_x,point_y),4)))
    print()
    print("That wraps up practice time. See you next time!")   
def calcRadius(x1,y1,x2,y2):

    radius = (((x1-x2) **2 + (y1-y2)**2 )**0.5)
    return(radius)

def main():
    doDistancePractice()
    calcDistance(x1,y1,x2,y2)
    doMidpointPractice()
    calcMidpoint(x1,y1,x2,y2)
    doRadiusPractice()
    calcRadius(x1,y1,x2,y2)
    

main()    

#I mainly got stuck figuring out why Distance practice went to the bottom when it should have been on the top of the project. The issue was after def main() I called a lot of functions in the wrong order causing it to display differently.
#The way that I tested this program was using my calculator and doing a whole bunch of test with these math formulas. Everything seemingly works perfectly fine. The thing I'd like to learn more is to build off of what I've learned from this project and put that into the next (Thats my usual approach to this class) I always open my previous project and study what I've done before going into the next.
#I think I officially learned how to do math in python Bills way. If not oops because that was my goal. I did learn a lot about how to improve previous projects if I had a second chance and how to do math going forward. 
