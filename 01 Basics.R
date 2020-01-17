# BASIC SYNTAX

print("Hello") # CTRL+ENTER executes the line in the console

x <- 1 # Assignment
x

myName <- "Pablo" # ALT + -
myName

x <- 2.5
y <- 3.3

# All usual math operations
x+y
x-y
x*y
x/y
3^2

# Vectors & Lists
v <- c(3,5,6.7)
v
2*v
v2 <- c(5.7,8.9,10)
v+v2
v-v2
v^2

vec <- 0:8
vec

vals <- 1:10
vals

vals <- seq(1,10,by=2)
vals

# ?seq Brings in the documentation of the function
# ??plot Looks for all functions in your R installation that relate to plot.

names <- c("Petr", "Jan", "Hana")
# Properties: typeof(), length()

#############################
# For loops and if conditions
#############################

# Print out every record in the names vector + message
for(i in 1:length(names)){
  print(names[i])
}

# If statements: Checks a condition and executes code
val <- 10
if(val<5){
  print("it is smaller than 5")
} else {
  print("It is not smaller than 5")
}

# NULL values
# - NA: existing, but useless values
# - NaN: Undefined values 8/0
# - NULL: Unexistant values
# - Inf and -Inf

numbers <- c("1","3.5")
typeof(numbers)
newNumbers <- as.numeric(numbers)
typeof(newNumbers)

names
as.numeric(names)

