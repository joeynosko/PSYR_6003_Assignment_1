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
