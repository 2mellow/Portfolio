#Markell Thornton
#Date 4/11/2023
#Breif description: This program creates a Grocery list and calculates the total ingredients needed for 12 people.

import math


PRICE_COCOA = 1.99
PRICE_SALT =0.49
PRICE_BAKING_POWDER =1.89
PRICE_ESPRESO_POWDER =5.39
PRICE_SUGAR = 1.99
PRICE_FLOUR_ALL_PURPOSE =1.99
PRICE_CHOCOLATE_CHIPS =1.99 
PRICE_BUTTER = 2.99
PRICE_VANILLA_EXTRACT =10.59
PRICE_EGGS_LARGE = 1.99

customers = int(input("Number of Customers: "))

#calculate items required for ONE customer
COCOA_UNIT = (106  / 28.34) / 12                                #grams to ounces 
SALT_UNIT = (6 / 28.34) / 12                                    #grams to ounces 
BAKING_POWDER_UNIT = (5 /28.34) / 12                            #grams to ounces
ESPRESSO_POWDER_UNIT = (2/ 28.34) / 12                          #grams to ounces
SUGAR_UNIT = ((447 / 28.34) / 16 ) / 12                         #grams to pounds
FLOUR_UNIT = ((180 / 28.34) / 16) / 12                          #grams to pounds
CHOCOLATE_CHIPS_UNIT = (340/28.34) / 12                         #grams to ounces
BUTTER_UNIT = 0.5 / 12                                          #pound to pound  -- no need to convert
VANILLA_EXTRACT_UNIT=(1 * 3 * (1/6)) / 12                       #tablespoon to ounces
EGGS_UNIT = 4 / 12                                              #no need


#calculate items required for N input customers
cocoa_required = COCOA_UNIT * customers
salt_required = SALT_UNIT * customers 
baking_required = BAKING_POWDER_UNIT * customers
espresso_rquired = ESPRESSO_POWDER_UNIT * customers
sugar_required = SUGAR_UNIT * customers
flour_required = FLOUR_UNIT * customers
chocolatechips_required = CHOCOLATE_CHIPS_UNIT * customers
butter_required = BUTTER_UNIT * customers
vanilla_required = VANILLA_EXTRACT_UNIT * customers
eggs_required = EGGS_UNIT * customers



#Calculate amount of containers
cocoa_containers = math.ceil(cocoa_required / 8)                    #1 cocoa container is 8 ounces
salt_containers = math.ceil(salt_required / 26)                     #2 salt container is 26 ounces
baking_containers = math.ceil(baking_required / 8.1)                #3 baking powder container is 8.1 ounces
espresso_containers = math.ceil(espresso_rquired / 7.05)            #4 Espresso powder container is 7.05 ounces 
sugar_containers = math.ceil(sugar_required / 4)                    #5 sugar container is 4 pounds 
flour_containers = math.ceil(flour_required / 5)                    #6 flour container is 5 pounds
chocolatechip_containers = math.ceil(chocolatechips_required / 12)  #7 chocolate chip container is 12 ounces
butter_containers = math.ceil(butter_required / 1)                  #8 butter container is1 pound
vanilla_containers = math.ceil(vanilla_required / 2)                #9 Vanilla extract container is 2 ounces
eggs_containers = math.ceil(eggs_required / 18)                     #10 Eggs container is 18 each 



total_price = cocoa_containers * PRICE_COCOA + salt_containers * PRICE_SALT + baking_containers * PRICE_BAKING_POWDER + espresso_containers * PRICE_ESPRESO_POWDER + sugar_containers * PRICE_SUGAR + flour_containers * PRICE_FLOUR_ALL_PURPOSE + chocolatechip_containers * PRICE_CHOCOLATE_CHIPS + butter_containers * PRICE_BUTTER + vanilla_containers * PRICE_VANILLA_EXTRACT + eggs_containers * PRICE_EGGS_LARGE

#Outputs
print("------------------------------")
print("Grocery List")
print("------------------------------")
print("Cocoa",cocoa_containers)
print("Salt", salt_containers)
print("Baking Powder", baking_containers)
print("Espresso Powder",espresso_containers)
print("Sugar", sugar_containers)
print("Flour",flour_containers)
print("Chocolate chips",chocolatechip_containers)
print("Butter",baking_containers)
print("Vanilla extract",vanilla_containers)
print("Eggs",eggs_containers)

print("==============================")
print("Total Price $", total_price)
