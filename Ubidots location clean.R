## read, edit, clean wx data from a single location

## This script parses a single locations full weather data file
## 1. removes "-" and makes NA 
## 2. Rounds Time to nearest 5 min increments
## 3. Breaks it into its 'relevent parts (soil, air, atms)
## 4. removes NA rows to condense df
## 5. joins it all back together
## 6. adds harvest year and location name cols
## 7. creates a new edited and formatted table for further munging. 

## get Working Directory

getwd()

##load some relevent libraries

library(tidyverse)
library(lubridate)

##load raw data from raw data folder
##make dashes = na

arapahoe <- read_csv("./raw/2020_arapahoe.csv", na = "-")

## round date/time to nearest 5 minute

arapahoe$`Human readable date`<- round_date(arapahoe$`Human readable date`, "5 mins")

##subset data for soils data and omit rows with NA to make a condensed data set

arapahoe_soil <- arapahoe %>% select('Human readable date':st3, sm1, st1, sm2, st2, sm1, st1) %>% na.omit()

## quick look at the data

head(arapahoe_soil)
str(arapahoe_soil)

## subset t/rh data

arapahoe_air <- arapahoe %>% select(`Human readable date`, t,d,h) %>% na.omit()

##combine soil and air data based on 5 minute time intervals

arapahoe_wx <- full_join(arapahoe_air, arapahoe_soil, by = "Human readable date")

##subset rain data3

arapahoe_rain <- arapahoe %>% select(`Human readable date`, r) %>% na.omit()

##add rain data

arapahoe_wx <- full_join(arapahoe_wx, arapahoe_rain, by = "Human readable date")

##subset wind and solar data

arapahoe_atms <- arapahoe %>% select(`Human readable date`, s, w) %>% na.omit

##add wind and solar data

arapahoe_wx <- full_join(arapahoe_wx, arapahoe_atms, by = "Human readable date")

##add harvest year and location name

arapahoe_wx <- arapahoe_wx %>% mutate(hrvst_yr = as.factor(2020), expt ="upvt", loc = as.factor("arapahoe"))

##check data

head(arapahoe_wx)

#export data

write_csv(arapahoe_wx, path = "./condensed/arapahoe_wx.csv")
write.csv(arapahoe_wx, file = "./condensed/arapahoe_wx_1.csv")

########################################
########################################


##Burlington Data

burlington <- read_csv("./raw/2020_burlington.csv", na = "-")

## round date/time to nearest 5 minute

burlington$`Human readable date`<- round_date(burlington$`Human readable date`, "5 mins")

##subset data for soils data and omit rows with NA to make a condensed data set

burlington_soil <- burlington %>% select('Human readable date':st3, sm1, st1, sm2, st2, sm1, st1) %>% na.omit()

## quick look at the data

head(burlington_soil)
str(burlington_soil)

## subset t/rh data

burlington_air <- burlington %>% select(`Human readable date`, t,d,h) %>% na.omit()

##combine soil and air data based on 5 minute time intervals

burlington_wx <- full_join(burlington_air, burlington_soil, by = "Human readable date")

##subset rain data

burlington_rain <- burlington %>% select(`Human readable date`, r) %>% na.omit()

##add rain data

burlington_wx <- full_join(burlington_wx, burlington_rain, by = "Human readable date")

##subset wind and solar data

burlington_atms <- burlington %>% select(`Human readable date`, s, w) %>% na.omit

##add wind and solar data

burlington_wx <- full_join(burlington_wx, burlington_atms, by = "Human readable date")

##add harvest year and location name

burlington_wx <- burlington_wx %>% mutate(hrvst_yr = as.factor(2020), expt ="upvt", loc = as.factor("burlington"))

##check data

head(burlington_wx)

#export data

write_csv(burlington_wx, path = "./condensed/burlington_wx.csv")

########################################
########################################


##Julesburg Data



julesburg <- read_csv("./raw/2020_julesburg.csv", na = "-")

## round date/time to nearest 5 minute

julesburg$`Human readable date`<- round_date(julesburg$`Human readable date`, "5 mins")

##subset data for soils data and omit rows with NA to make a condensed data set

julesburg_soil <- julesburg %>% select('Human readable date':st3, sm1, st1, sm2, st2, sm1, st1) %>% na.omit()

## quick look at the data

head(julesburg_soil)
str(julesburg_soil)

## subset t/rh data

julesburg_air <- julesburg %>% select(`Human readable date`, t,d,h) %>% na.omit()

##combine soil and air data based on 5 minute time intervals

julesburg_wx <- full_join(julesburg_air, julesburg_soil, by = "Human readable date")

##subset rain data

julesburg_rain <- julesburg %>% select(`Human readable date`, r) %>% na.omit()

##add rain data

julesburg_wx <- full_join(julesburg_wx, julesburg_rain, by = "Human readable date")

##subset wind and solar data

julesburg_atms <- julesburg %>% select(`Human readable date`, s, w) %>% na.omit

##add wind and solar data

julesburg_wx <- full_join(julesburg_wx, julesburg_atms, by = "Human readable date")

##add harvest year and location name

julesburg_wx <- julesburg_wx %>% mutate(hrvst_yr = as.factor(2020), expt ="upvt", loc = as.factor("julesburg"))

##check data

head(julesburg_wx)

#export data

write_csv(julesburg_wx, path = "./condensed/julesburg_wx.csv")


########################################
########################################


##Roggen Data



roggen <- read_csv("./raw/2020_roggen.csv", na = "-")

## round date/time to nearest 5 minute

roggen$`Human readable date`<- round_date(roggen$`Human readable date`, "5 mins")

##subset data for soils data and omit rows with NA to make a condensed data set

roggen_soil <- roggen %>% select('Human readable date':st3, sm1, st1, sm2, st2, sm1, st1) %>% na.omit()

## quick look at the data

head(roggen_soil)
str(roggen_soil)

## subset t/rh data

roggen_air <- roggen %>% select(`Human readable date`, t,d,h) %>% na.omit()

##combine soil and air data based on 5 minute time intervals

roggen_wx <- full_join(roggen_air, roggen_soil, by = "Human readable date")

##subset rain data

roggen_rain <- roggen %>% select(`Human readable date`, r) %>% na.omit()

##add rain data

roggen_wx <- full_join(roggen_wx, roggen_rain, by = "Human readable date")

##subset wind and solar data

roggen_atms <- roggen %>% select(`Human readable date`, s, w) %>% na.omit

##add wind and solar data

roggen_wx <- full_join(roggen_wx, roggen_atms, by = "Human readable date")

##add harvest year and location name

roggen_wx <- roggen_wx %>% mutate(hrvst_yr = as.factor(2020), expt ="upvt", loc = as.factor("roggen"))

##check data

head(roggen_wx)

#export data

write_csv(roggen_wx, path = "./condensed/roggen_wx.csv")


########################################
########################################


##lamar Data



lamar <- read_csv("./raw/2020_lamar.csv", na = "-")

## round date/time to nearest 5 minute

lamar$`Human readable date`<- round_date(lamar$`Human readable date`, "5 mins")

##subset data for soils data and omit rows with NA to make a condensed data set

lamar_soil <- lamar %>% select('Human readable date':st3, sm1, st1, sm2, st2, sm1, st1) %>% na.omit()

## quick look at the data

head(lamar_soil)
str(lamar_soil)

## subset t/rh data

lamar_air <- lamar %>% select(`Human readable date`, t,d,h) %>% na.omit()

##combine soil and air data based on 5 minute time intervals

lamar_wx <- full_join(lamar_air, lamar_soil, by = "Human readable date")

##subset rain data

lamar_rain <- lamar %>% select(`Human readable date`, r) %>% na.omit()

##add rain data

lamar_wx <- full_join(lamar_wx, lamar_rain, by = "Human readable date")

##subset wind and solar data

lamar_atms <- lamar %>% select(`Human readable date`, s, w) %>% na.omit

##add wind and solar data

lamar_wx <- full_join(lamar_wx, lamar_atms, by = "Human readable date")

##add harvest year and location name

lamar_wx <- lamar_wx %>% mutate(hrvst_yr = as.factor(2020), expt ="upvt", loc = as.factor("lamar"))

##check data

head(lamar_wx)

#export data

write_csv(lamar_wx, path = "./condensed/lamar_wx.csv")

########################################
########################################


##yuma Data



yuma <- read_csv("./raw/2020_yuma.csv", na = "-")

## round date/time to nearest 5 minute

yuma$`Human readable date`<- round_date(yuma$`Human readable date`, "5 mins")

##subset data for soils data and omit rows with NA to make a condensed data set

yuma_soil <- yuma %>% select('Human readable date':st3, sm1, st1, sm2, st2, sm1, st1) %>% na.omit()

## quick look at the data

head(yuma_soil)
str(yuma_soil)

## subset t/rh data

yuma_air <- yuma %>% select(`Human readable date`, t,d,h) %>% na.omit()

##combine soil and air data based on 5 minute time intervals

yuma_wx <- full_join(yuma_air, yuma_soil, by = "Human readable date")

##subset rain data

yuma_rain <- yuma %>% select(`Human readable date`, r) %>% na.omit()

##add rain data

yuma_wx <- full_join(yuma_wx, yuma_rain, by = "Human readable date")

##subset wind and solar data

yuma_atms <- yuma %>% select(`Human readable date`, s, w) %>% na.omit

##add wind and solar data

yuma_wx <- full_join(yuma_wx, yuma_atms, by = "Human readable date")

##add harvest year and location name

yuma_wx <- yuma_wx %>% mutate(hrvst_yr = as.factor(2020), expt ="upvt", loc = as.factor("yuma"))

##check data

head(yuma_wx)

#export data

write_csv(yuma_wx, path = "./condensed/yuma_wx.csv")


########################################
########################################


##akron Data



akron <- read_csv("./raw/2020_UVPT_AKRON_ADALOGGER_edit.csv", na = "-")

## format date with lubridate to Posixct

akron$Date <- ymd(akron$Date)

## format time with lubridate

akron$time <- hms(akron$time)

str(akron)

#combine date and time using dplyr::mutate

akron <- akron %>% mutate('Human readable date' = Date + time)

#remove Date and time columns using dplyr::select


akron <- akron %>% select(- Date, - time)


head(akron)
str(akron)

akron <- akron %>% mutate(hrvst_yr = as.factor(2020), expt ="upvt", loc = as.factor("akron"))


##akron ubidots data from each of 2 boron downloads

akron1 <- read_csv("./raw/Ubidots_Akron_March_11_2020 - April 27 2020.csv", na = "-")
akron1$`Human readable date` <- mdy_hms(akron1$`Human readable date`)

str(akron1)



## round date/time to nearest 5 minute

akron1$`Human readable date`<- round_date(akron1$`Human readable date`, "5 mins")

##subset data for soils data and omit rows with NA to make a condensed data set

akron1_soil <- akron1 %>% select('Human readable date':st3, sm1, st1, sm2, st2, sm1, st1) %>% na.omit()

## quick look at the data

head(akron1_soil)
str(akron1_soil)

## subset t/rh data

akron1_air <- akron1 %>% select(`Human readable date`, t,d,h) %>% na.omit()

##combine soil and air data based on 5 minute time intervals

akron1_wx <- full_join(akron1_air, akron1_soil, by = "Human readable date")

##subset rain data

akron1_rain <- akron1 %>% select(`Human readable date`, r) %>% na.omit()

##add rain data

akron1_wx <- full_join(akron1_wx, akron1_rain, by = "Human readable date")

##subset wind and solar data

akron1_atms <- akron1 %>% select(`Human readable date`, s, w) %>% na.omit

##add wind and solar data

akron1_wx <- full_join(akron1_wx, akron1_atms, by = "Human readable date")

##add harvest year and location name

akron1_wx <- akron1_wx %>% mutate(hrvst_yr = as.factor(2020), expt ="upvt", loc = as.factor("akron"))

##check data

head(akron1_wx)

###################################################################################
################################################################################### 

##2nd set of ubidots data

akron2 <-  read_csv("./raw/Ubidots_Akron_Sept 9_2019-March_11_2020_e00fce686e0ab8af01ce9b60.csv", na = "-")

str(akron2)


## round date/time to nearest 5 minute

akron2$`Human readable date`<- round_date(akron2$`Human readable date`, "5 mins")

##subset data for soils data and omit rows with NA to make a condensed data set

akron2_soil <- akron2 %>% select('Human readable date':st3, sm1, st1, sm2, st2, sm1, st1) %>% na.omit()

## quick look at the data

head(akron2_soil)
str(akron2_soil)

## subset t/rh data

akron2_air <- akron2 %>% select(`Human readable date`, t,d,h) %>% na.omit()

##combine soil and air data based on 5 minute time intervals

akron2_wx <- full_join(akron2_air, akron2_soil, by = "Human readable date")

##subset rain data

akron2_rain <- akron2 %>% select(`Human readable date`, r) %>% na.omit()

##add rain data

akron2_wx <- full_join(akron2_wx, akron2_rain, by = "Human readable date")

##subset wind and solar data

akron2_atms <- akron2 %>% select(`Human readable date`, s, w) %>% na.omit

##add wind and solar data

akron2_wx <- full_join(akron2_wx, akron2_atms, by = "Human readable date")

##add harvest year and location name

akron2_wx <- akron2_wx %>% mutate(hrvst_yr = as.factor(2020), expt ="upvt", loc = as.factor("akron"))

##check data

head(akron2_wx)

###################################################################################
###################################################################################

#join all akron data together (akron, akron1_wx, akron2_wx)

akron_wx <- bind_rows(akron, akron1_wx)
akron_wx <- bind_rows(akron_wx, akron2_wx)

head(akron_wx)

#export data

write_csv(akron_wx, path = "./condensed/akron_wx.csv")

########################################
########################################


##Orchard Data


orchard <- read_csv("./raw/2020_ADALOGGER_ORCH5MN.csv")

head(orchard)
str(orchard)

##seperate out Loc col into hrvst year, exp, loc and classify as factors

orc <- orchard %>% separate(Loc, into = c('hrvst_yr', 'expt'), sep = 4) 
orc <- orc %>% separate(expt, into = c('expt','loc'), sep = 4) 

orc$hrvst_yr <- as.factor(orc$hrvst_yr)
orc$exp <- as.factor(orc$exp)
orc$loc <- as.factor(orc$loc)

orc$'Human readable date' <- ymd(orc$Date) + hms(orc$`Time(MT)`)

## round date/time to nearest 5 minute

orc$`Human readable date`<- round_date(orc$`Human readable date`, "5 mins")

## rename cols to match other env data

orc <- rename(orc, c("sm1" = "Cap1", 
              "sm2" = "Cap2", 
              "sm3" = "Cap3", 
              "st1" = "ST1" , 
              "st2" = "ST2" , 
              "st3" = "ST3" , 
              "t"   = "AirTemp", 
              "h" = "RH", 
              "d" = "DewPt",
              "s" = "ravg",
              "r" = "Rain(in)",
              "w" = "wind_(mps)"))

##select cols

orchard_wx <- select(orc, sm1, sm3, sm3, st1, st2, st3, t, h, d, s, w, r, hrvst_yr, expt, loc, 'Human readable date')

##check data

head(orchard_wx)
str(orchard_wx)

#export data

write_csv(orchard_wx, path = "./condensed/orchard_wx.csv")

########################################
########################################

#Brandon 2020 wx data

## need to combine Ubidots data from 3 different devices. 
## 


br1 <- read_csv("./raw/Brandon_B3G3-Sept11-2019-Feb 19-2020_e00fce682881701d55a85b39.csv", na = "-")
br2 <- read_csv("./raw/Brandon_B3G5 - March 10-2020-March 18-2020.csv", na = "-")
br3 <- read_csv("./raw/Brandon_BL5 - March 18-2020 - July 1 2020", na = "-")


br1 %>% mdy_hm('Human readable date')



