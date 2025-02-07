library(tidyverse)
library(readr)
library(dplyr)
avengers <- read_csv("avengers.csv")#import the data
View(avengers)
avengers_no_NA<- na.omit(avengers)
view(avengers_no_NA)
CombatEffectiveness<- mutate(avengers_no_NA, CombatEffectiveness = (agility + speed + strength + willpower))#new variable which is sum of agility, speed, strength, and willpower
view(CombatEffectiveness)
nosupedead<- filter(CombatEffectiveness, superpower == "no" & died == "yes")#filtered by those who have no power and died. 
view(nosupedead)
write.csv(nosupedead, "avengers_nosuper_died.csv", row.names=F)#saving data of those w/o superpowers who died to .csv
install.packages("foreign")
library(foreign)
write.foreign(nosupedead, "avengers_nosuper_died.sav", "avengers_nosuper_died.sps", package=c("SPSS"))#saving data of those w/o superpowers who died to SPSS file
#summarize to understand the properties of combat effectiveness, kills, and injuries. Mean, SD, range. 
reframe(nosupedead, mean(CombatEffectiveness), sd(CombatEffectiveness), range(CombatEffectiveness))#mean, sd, and range of combat effectiveness. got warning to use reframe() instead of summarize()
reframe(nosupedead, mean(kills), sd(kills), range(kills))#mean, sd, and range of kills. 
reframe(nosupedead, mean(injuries), sd(injuries), range(injuries))#mean, sd, and range of injuries. 
#dividing the data into north and south. 
nosupedead_N<- filter(nosupedead, north_south == "north")
nosupedead_S<- filter(nosupedead, north_south == "south")
#summary stats for north group 
reframe(nosupedead_N, mean(CombatEffectiveness), sd(CombatEffectiveness), range(CombatEffectiveness))
reframe(nosupedead_N, mean(kills), sd(kills), range(kills))
reframe(nosupedead_N, mean(injuries), sd(injuries), range(injuries))
#summary stats for south group 
reframe(nosupedead_S, mean(CombatEffectiveness), sd(CombatEffectiveness), range(CombatEffectiveness))
reframe(nosupedead_S, mean(kills), sd(kills), range(kills))
reframe(nosupedead_S, mean(injuries), sd(injuries), range(injuries))
