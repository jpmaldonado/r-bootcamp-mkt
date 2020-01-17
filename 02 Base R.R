################################
# READING AND WORKING WITH DATA
################################

airbnb <- read.csv("./data/tomslee_airbnb_belgium_1454_2017-07-14.txt")
View(airbnb) # Show the data set

head(airbnb) # shows first 6 rows
tail(airbnb)
summary(airbnb)

head(airbnb$price) # $ allows to select a single column
names(airbnb) # list of columns in the dataframe
nrow(airbnb) # number of rows
ncol(airbnb) # number of columns

# Let's look at the distribution of prices
summary(airbnb$price)
hist(airbnb$price) # histogram of prices
boxplot(airbnb$price)

# Let's dig deeper into the data, by filtering those values
airbnb$price>150 # Flats that are above 150 EUR/night

# We can use this vector so filter out expensive flats
expensiveAirbnb <- airbnb[airbnb$price>150,]
# The above is equivalent to SELECT * FROM airbnb WHERE price>150

airbnb[1,"price"]
names(airbnb)

airbnb[1,c("price", "overall_satisfaction")] # First flat, 2 cols

# Trivia: How could I look at flats in Brussels?
myKPIs <- c("price", "bathrooms", 
            "location", "reviews", "overall_satisfaction")

df <- airbnb[airbnb$borough == "Brussel",myKPIs]
head(df)

unique(df$bathrooms)
unique(df$price)

hist(df$price)
boxplot(df$price)
names(df)

# Let's remove records with satisfaction 0
df <- df[df$overall_satisfaction>0,]
plot(df$overall_satisfaction, df$price)



df[df$overall_satisfaction==1,] # All rows with sat==1, all cols
df[df$overall_satisfaction==1,c("reviews")]
df[df$overall_satisfaction==1,c("reviews","location")]

