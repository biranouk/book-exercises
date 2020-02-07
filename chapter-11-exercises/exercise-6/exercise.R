# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
View(airports)
View(flights)
avg_delay_dest <- flights %>% 
                  group_by(dest) %>% 
                  summarise(avg_delay = mean(arr_delay, na.rm = TRUE)) %>% 
                  rename(faa = dest)

left_join(avg_delay_dest, airports, by = "faa")

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?

flights %>% 
  group_by(carrier) %>% 
  summarise(avg_delay_dest = mean(arr_delay, na.rm = TRUE)) %>% 
  left_join(airlines, by = "carrier")
