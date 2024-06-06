#Markell Thornton
#5/13/2023

cals_per_min = 4.2
duration = 10
num_durations = 5

for _ in range(num_durations):
    cals_burned = duration * cals_per_min
    print(str(duration) + " minutes --> " + str(cals_burned) + " calories")
    duration += 5
