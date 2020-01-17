######################
# The tidyverse
######################

#install.packages("tidyverse"): Install packages
library(tidyverse)
media <- read.csv("data/OnlineNewsPopularity.csv")
names(media)

# Tidyverse: collection of libraries. Dplyr and ggplot2

#################
# Dplyr
#################

# We use "verbs" to query our data in a nice way :)
# Filter articles that went viral

# In base R:
media[media$shares>4e5,c("url")]

# Dplyr, way 1:
filter(media, shares>4e5)

# Dplyr, way 2:
media %>% filter(shares>4e5)

# %>% is called 'pipe operator' and can be read as 'and then'
# For example: 
media %>% filter(shares>4e5) %>% select(url)
# this reads as "media, and then filter, and then select"

# OTHER VERBS
# slice()
media %>% slice(15:18) # selects a slice of rows

# arrange()
# Example: look at the five most shared articles

media %>% 
  arrange(desc(shares)) %>% 
  select(shares,url) %>% 
  head(5)

# rename()

media %>% 
  rename(article_link = url) %>%
  select(article_link, shares) %>%
  head(3)

media %>% distinct(is_weekend)

table(media$is_weekend)

# GROUP BY 


# Example: Check the average number of shares 
# in weekend/weekday

media %>%
  group_by(is_weekend) %>%
  summarise(avg_shares=mean(shares))




myTable <- media %>%
              group_by(is_weekend, data_channel_is_bus) %>%
              summarise(
                avg_shares = mean(shares),
                total_shares = sum(shares), 
                median_shares = median(shares)
                ) %>% glimpse

# SHIFT + CTRL + M = %>% 
# ALT + SHIFT + E = Motivation


media %>%
  group_by(is_weekend, data_channel_is_bus) %>%
  summarise(
    avg_shares = mean(shares),
    total_shares = sum(shares), 
    median_shares = median(shares)
  ) 



