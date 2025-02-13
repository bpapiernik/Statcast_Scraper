# load in the libraries

library(tidyverse)
library(baseballr)

# creating a function that ends up scrapping the Statcast pitch level data daily
# Statcast must be scrapped by each day because their is a limit of how many pitches

# Define the date range

start_date <- as.Date("2024-03-20")
end_date <- as.Date("2024-10-30")
season <- seq.Date(start_date, end_date, by = "day")

# initialize empty df

statcast_2024 <- data.frame()

# loop through each day of the season to scrap the Statcast data
for (i in seq_along(season)) {
  
  temp <- statcast_search(start_date = season[i], end_date = season[i]) 
    
  
  if (!is.null(temp) && nrow(temp) > 0) {  # Only append if there's data
    statcast_2024 <- rbind(statcast_2024, temp)
  }
}

