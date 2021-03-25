
## Challenge to scrape AFLW stats from web and do data viz
## 21 March 2021
## Burnet Coding and Software Club 2021

#setwd("/Users/sachintha/projects/AFL_fitzRoy/")

 install.packages("fitzRoy")
# https://jimmyday12.github.io/fitzRoy/articles/womens-stats.html

#---------------

library(fitzRoy)
library(dplyr)
library(tidyverse)
#---------------
#---------------
# fetch data

year <- c("2017", "2018", "2019", "2020", "2021")
round <- c(1,2,3,4,5,6,7)


alfwr1_2020 <- fetch_player_stats(2020, round_number = 1, comp = "AFLW") 
alfwr2_2020 <- fetch_player_stats(2020, round_number = 2, comp = "AFLW") 
alfwr3_2020 <- fetch_player_stats(2020, round_number = 3, comp = "AFLW") 
alfwr4_2020 <- fetch_player_stats(2020, round_number = 4, comp = "AFLW") 
alfwr5_2020 <- fetch_player_stats(2020, round_number = 5, comp = "AFLW") 
alfwr6_2020 <- fetch_player_stats(2020, round_number = 6, comp = "AFLW") 
alfwr7_2020 <- fetch_player_stats(2020, round_number = 7, comp = "AFLW") 
#alfwr8_2020 <- fetch_player_stats(2020, round_number = 8, comp = "AFLW") 
#alfwr9_2020 <- fetch_player_stats(2020, round_number = 9, comp = "AFLW") 


#Lest see what the fetch_player_stats is about
?fetch_player_stats
#Provides Individual Player Statistics for AFL game

#Get stats form 2017 - 2020 
# this is not working all_seasons <- fetch_player_stats(season = c(2017,2020), comp = "AFLW")

season_2017 <- fetch_player_stats(season = 2017, comp = "AFLW")
season_2018 <- fetch_player_stats(season = 2018, comp = "AFLW")
season_2019 <- fetch_player_stats(season = 2019, comp = "AFLW")
season_2020 <- fetch_player_stats(season = 2020, comp = "AFLW")

#lets just wok on the 2020 player stat
colnames(season_2020)
#check the names of each round
unique(season_2020$round.name)


#see clubs played home
unique(season_2020$home.team.club.name)
#see clubs played away
unique(season_2020$away.team.club.name)


#See team names of players
unique(season_2020$team.name)









#based on the colnames colum 16 was player 1st name and 17 was last name
#lets combne them for easier analysis
all_rounds <- unite(all_rounds, player_full_name, 16:17, remove = FALSE )

all_rounds_all_years <- fetch_player_stats(comp = "AFLW")
unique(all_rounds_all_years$compSeason.shortName)

colnames(all_rounds_all_years)
plo

View(all_rounds)
?unite

#for (rounds in c(1:7)) {
#  rounds <- fetch_player_stats(2020, round_number = rounds, comp = "AFLW")

#}




colnames(alfwr1_2020)


## END



