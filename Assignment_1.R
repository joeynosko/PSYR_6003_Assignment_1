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
#summary stats (mean, sd, & range) for combat effectiveness, kills, and injuries for the North group
reframe(nosupedead_N, mean(CombatEffectiveness), sd(CombatEffectiveness), range(CombatEffectiveness))
reframe(nosupedead_N, mean(kills), sd(kills), range(kills))
reframe(nosupedead_N, mean(injuries), sd(injuries), range(injuries))
#summary stats (mean, sd, & range) for combat effectiveness, kills, and injuries for the South group 
reframe(nosupedead_S, mean(CombatEffectiveness), sd(CombatEffectiveness), range(CombatEffectiveness))
reframe(nosupedead_S, mean(kills), sd(kills), range(kills))
reframe(nosupedead_S, mean(injuries), sd(injuries), range(injuries))
#Question 8 
install.packages("pwr")#installs package needed for power analyses
library(pwr)
pwr.t.test(d = .3, sig.level = 0.05, power = .95)#gives us the recommended sample for our specified t-test. 
#the recommended sample size in each group is 234.4627
#Question 9 
library(TOSTER)
library(dplyr)
avengers_no_NA %>% count(superpower)#figuring out the numbers in each group (superpowers and no superpowers)
x <- c(32, 780)#creating a vector so both sample sizes (superpowers = yes and superpowers = no) can be inputted into the calculation. 
power_t_TOST(n = 235, low_eqbound = -0.3, high_eqbound = 0.3, alpha = 0.05, type = "two.sample")#calculating power of our test to find a null effect, defined here as an effect size ranging from a d of -0.3 to 0.3. 
#the power of this test is 0.8909247
#Question 10 
library(effectsize)
#assigning the test statistic and sample sizes to variables to be used in effect size conversion. 
t <- 4.25
n1 <- 32
n2 <- 780
t_to_d(t, df_error = n1+n2-2, paired = FALSE)#converts test statistic into effect size with 95% confidence interval. 
cohen.ES(test="t", size = "small")#reminds me what a small effect size is. 
#d = 0.30 [0.16, 0.44] - this is a SMALL effect size using Cohen's (1982) convention.