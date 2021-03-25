
## Challenge to scrape AFLW stats from web and do data viz
## 26 March 2021
## Burnet Coding and Software Club 2021

#setwd("/Users/sachintha/projects/AFL_fitzRoy/")

#install.packages("fitzRoy")
# https://jimmyday12.github.io/fitzRoy/articles/womens-stats.html

#---------------
library(fitzRoy)
library(tidyverse)
#---------------
#---------------
# fetch data
#Wok with player stats

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
season_2020 <- unite(season_2020, player_full_name, 16:17, remove = FALSE )
View(season_2020)


richmond_2020 <- filter(.data = season_2020,season_2020$team.name=="Richmond")


richmond_2020$shotEfficiency

plot_rich_ef_shot <- richmond_2020 %>%
  ggplot(mapping = aes(x = player_full_name, y = metresGained )) + 
  geom_col() + coord_flip()



plot_rich_ef_shot
ggsave("figures/metersGained_richmond.pdf", plot_rich_ef_shot)



## END



