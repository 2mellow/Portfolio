#Markell Thornton
#5/16/2023

# Define global constants
# Each category has a weighting toward the overall match
ATHLETICISM_WEIGHT = 0.15
FOOD_OUT_WEIGHT = 0.1
ENTERTAINMENT_OUT_WEIGHT = 0.15
RELATIONSHIP_SERIOUSNESS_WEIGHT = 0.20
RELIGION_WEIGHT = 0.20
POLITICS_WEIGHT = 0.20

def rate(rating1, rating2):
    difference = abs(rating1-rating2)
    if difference <= 1:
         match_probability = 1
    elif difference <= 3:
        match_probability = 0.7
    elif difference <= 6:
        match_probability = 0.4
    else:
        match_probability = 0

    return match_probability

def match(person1,person2):
    probability_overall_match = 0

    # Here the first 4 categories that do not have special cases are evaluated.
    # They are evaluated directly with the rate function
    
    probability_overall_match = probability_overall_match + ATHLETICISM_WEIGHT * rate(person1[0],person2[0])
    probability_overall_match = probability_overall_match + FOOD_OUT_WEIGHT * rate(person1[1],person2[1])
    probability_overall_match = probability_overall_match + ENTERTAINMENT_OUT_WEIGHT * rate(person1[2],person2[2])
    probability_overall_match = probability_overall_match + RELATIONSHIP_SERIOUSNESS_WEIGHT * rate(person1[3],person2[3])

    # Politics and religion are special cases.

    # For religion, if either person is rated at 8 or above on religiosity, then a match on their religions yields a 100%
    # match in that category. If their religions don’t match, then it’s 50% for that category.
    # But if neither is that religious, the normal rating scale is used.
    # For example, if person 1 rates themselves at 8 for religiosity, and person 2 rates themselves 6, and both say they are Buddhists,
    # then their category is matched at 100%. But if person 2 is an Atheist, the match would be 50%.

    # if neither is that religious, the normal rating scale is used.

    if person1[5].lower() == "atheist" and person2[5].lower() == "atheist":
        probability_overall_match = probability_overall_match + RELIGION_WEIGHT * rate(person1[4],person2[4])
    else:
        if person1[4]>=8 or person2[4]>=8:
            if person1[5].lower() == person2[5].lower():
                probability_overall_match = probability_overall_match + RELIGION_WEIGHT * 1
            else:
                probability_overall_match = probability_overall_match + RELIGION_WEIGHT * 0.5
        else:
           probability_overall_match = probability_overall_match + RELIGION_WEIGHT * rate(person1[4],person2[4])

    # For politics, if either person is rated at 9 or above for politics (zeal),
    # then the category is determined by the rating of the political leaning.
    # If neither person is that political, then the normal rating scale is applied to political zeal.
    # For example, if person 1 has a politics rating of 4 (not too political), and person 2 a rating of 5,
    # then the normal rating applies, which is a difference of 1, so the category would match at 100%.

    if person1[6] >= 9 or  person2[6] >= 9:
        probability_overall_match = probability_overall_match + POLITICS_WEIGHT * rate(person1[7],person2[7])
    else:
        probability_overall_match = probability_overall_match + POLITICS_WEIGHT * rate(person1[6],person2[6])
        

    return probability_overall_match       
                
        
    
        
def main():

    person1 = (7, 10, 8, 9, 10, "buddhism",6, 8)
    person2 = (4, 5, 6, 10, 8, "judaism", 3, 2)

    probability_overall_match = match(person1,person2)


    print("The probability of a compatible match is "  + format(probability_overall_match*100,".1f") + "%")
    
    
    
if __name__ == "__main__":
    main()

# My approach to this program was referencing old code to get some sort of idea about where to start. I just did what I always do type,type,type and run a few test until I get something that starts to work as described in the project document. 
# I think that it works perfectly fine. The one thing I'd really like to do in the future is make the output more interesting. (Something that isn't just a line of text and a calculated number) then again the goal was to find the probability of a possible match.
# I learned that some codes can lack a lot of color. There's a lot of typing in this one but its mostly just text. I think proj2 looked similar. Its also amazing how many functions, or useless lines of code that I might have had in the past. (I still feel pretty terrible at coding) everything I've done has been trial and error. 
