# Asterisked functions must be defined in formulas.py

def calcDistance(x1,y1,x2,y2):
    distance = ((x2-x1) **2 + (y2-y1)** 2)**.5
    return(distance)

def calcMidpoint(x1,y1,x2,y2):
    midpoint_x =(x1+x2) / 2
    midpoint_y = (y1+y2) /2
    return(midpoint_x,midpoint_y)


def calcRadius(x1,y1,x2,y2):
    radius = (((x1-x2) **2 + (y1-y2)**2 )**0.5)
    return(radius)
