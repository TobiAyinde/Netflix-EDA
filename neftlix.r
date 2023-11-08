# set working directory
setwd(dirname(file.choose()))
getwd()

# read in data from csv file
netflix <- read.csv("netflix.csv", stringsAsFactors = TRUE)
head(netflix)
str(netflix)

#----------------Data Exploration------------------------------------
# check for missing data
apply(netflix, MARGIN = 2, FUN = function(x) sum(is.na(x)))
library(Amelia)
missmap(netflix, col = c("black", "tomato"), legend = TRUE)
netflix <- na.omit(netflix)

# summarise the numerical variables - see ranges, outliers? approx normal?
summary(netflix)



library(dplyr)  # Load the dplyr package for data manipulation

netflix %>%
  group_by(type)%>%
  summarise(count = n ())

#-------------------------BAR PLOT FOR TYPE OF SHOWS---------------------------
library(ggplot2)
netflix %>%
  group_by(type) %>%
  summarize(count = n()) %>%
  ggplot() + 
  geom_col(aes(x = type, y = count)) +
  theme_minimal() + 
  labs(title = "Netflix Show Type Count") 

#--------------------------------PIE CHART--------------------------------------

library(plotly)  # Load the plotly package for interactive plots

amount_by_type <- netflix %>%
  group_by(type) %>%
  summarise(count = n())

fig1 <- plot_ly(amount_by_type, labels = ~type, values = ~count, type = 'pie', marker = list(colors = c("tomato", "#bd3"))
)
fig1 <- fig1 %>% layout(title = 'Amount Of Netflix Content By Type',
                        xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)
)

fig1

#----------------------------MOVIE DISTRIBUTION---------------------------------

netflix %>%
  filter(type == 'Movie') %>%
  mutate(duration_in_mins = as.numeric(gsub("[^0-9]", "", duration))) %>%
  summarize(mean_duration = mean(duration_in_mins, na.rm = TRUE))

netflix %>%
  filter(type == 'Movie') %>%
  mutate(duration_in_mins = as.numeric(gsub("[^0-9]", "", duration))) %>%
  ggplot() + geom_density(aes(x = duration_in_mins)) +
  labs(title = 'Distribution of Movie Duration',
       subtitle = 'in Minutes')

##---------------------BAR CHART OF MOVIES VS COUNTRIES-------------------------

library(stringr)  # Load the stringr package for string manipulation

netflix %>%
  filter(!str_detect(country, ',')) %>%
  group_by(country) %>%
  count() %>%
  arrange(desc(n)) %>%
  head(20) %>%
  ggplot() + 
  geom_col(aes(y = reorder(country, n), x = n)) +
  geom_label(aes(y = reorder(country, n), x = n, label = n)) +
  labs(title = 'No. of Movies per Country',
       subtitle = 'Top 20 Countries')



#-------------------BAR CHART OF GENRE VS TITLES--------------------------------


library(tidyr)
library(stringr)  # Load the stringr package for string manipulation

netflix %>%
  select(listed_in) %>%
  mutate(listed_in = str_split(listed_in, ', ')) %>%
  unnest(listed_in) %>%
  group_by(listed_in) %>%
  count() %>%
  arrange(desc(n)) %>%
  head(30) %>%
  ggplot() + 
  geom_col(aes(y = reorder(listed_in, n), x = n)) +
  labs(title = 'Genres Vs Titles',
       x = 'No. of Titles',
       y = 'Genre')

#-------------------------------------------------------------------------------
# remove all variables from the environment
rm(list=ls())




