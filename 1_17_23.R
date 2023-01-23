#### Vectore, Matrices, Data Frames, and Lists
#### January 17th, 2023
####JWD

## Vectors Continued
### Properties


## Coercion:

# All atomic vectors are of the same data type
  ## If you use c() to assemble data types, R "coerces them"
      ## LOGICAL > INTEGER > DOUBLE > CHARACTER

###EXAMPLE
a <- c(2,2.2)
a #coerces to double

b <- c("purple", "green")
typeof(b) #character

d <- c(a, b)
print(d)
typeof(d) $character


### Comparison Operators: yield a "logical" result:
a <- runif(10)
print(a)

a > 0.5 # conditional statement (T/F appear in console)

### How many elements in the vector are > 0.5
sum(a > 0.5) # number of elements >0.5 NOT sum of elements' value
mean(a > 0.5) # what proportion of vector are greater than 0.5 NOT mean of vectors >0.5


### Vectorization: add a constant to a variable

# EXAMPLE
z <- c(10, 20, 30)
print(z)
z + 1
print(z)

## What happens when vectors are added together?

y <- c(1, 2, 3)
z + y # results is an "Element by Element" operation on the vector

##Recycling: 

# EXAMPLE
z
x <- c(1,2)
z + x # warning is issued but calculation is still made...the shorter vector is always recycles 


### Simulating data: runif() rnorm()

runif(5) # five random numbers between 0-1

runif(n=5, min=5, max=10) #n=same size

set.seed(123) # set.seed can be any number and sets random number generator (is reproducible)
runif(n=5, min=5, max=10)

## rnorm: random normal values with mean: 0 and stand deviation: 1 

randomNormalNumbers <- rnorm(100) #generates
print(randomNormalNumbers)
mean(randomNormalNumbers)
hist(randomNormalNumbers)

rnorm(n=100, mean=100, sd=30)
hist(rnorm(n=100, mean=100, sd=30))


##### MATRIX AND MATRICES DATA STRUCUTRE: Matrix is an atomic vector organized into rows and columns

## 2-Dimensional (rows and columns)
  ## Homogenous data type (must all be one data type...usually numeric)

# EXAMPLE

my_vec <- 1:12

m <- matrix(data = my_vec, nrow = 4)
print(m)

m <- matrix(data = my_vec, ncol = 3)
print(m)

m <- matrix(data = my_vec, ncol = 3, byrow =TRUE)
print(m) #the default is byrow(F), which organizes by column, byrow(T) to organize by row


#### LISTS: simlar to atomic vectors BUT each element can hold different data types (and different sizes)

my_list <- list(1:10, matrix(1:8, nrow=4, byrow=TRUE), letters[1:3], pi)
class(my_list)
str(my_list) #information on each element in the list

### SUBESETTING Lists: using [] guves you a single item BUT not the elements
my_list[4] #isolates 
my_list[4] - 3 # causes error...Single Bracket gives you only elements in the slot which is always type=list
typeof(my_list[4])

my_list[[4]] ## [[]] allows you to grab individual values
my_list[[4]] - 3

my_list[[2]] # gives just Matrix in console because it [2] item listed
my_list[[2]][4,1] #First isolates Matrix then provides location in the matrix (4th row, 1st column)

c(my_list[1], my_list[2]) #to obtaion multiple compartments of list
c(my_list[[1]], my_list[[2]])# to obtain multiple elements within a list

###Name list items when they are creater
mylist2 <- list(Tester = FALSE, littleM = matrix(1:9, nrow=3))
print(mylist2)

mylist2$littleM[2,3] #extracts 2nd row 3rd column of littleM


mylist2$littleM[2,] # Leaving Blank provides entire column (second row, all columns)

mylist2$littleM[,3]

mylist2$littleM[2] #gives second element in matrix

### unlist: strings elements back to a vector
unRolled <- unlist(mylist2)
unRolled

data(iris)
head(iris)
plot(Sepal.Length ~ Petal.Length, data = iris) #y~x
model <- lm(Sepal.Length ~ Petal.Length, data = iris)
print(model) #lm() only provides coefficients
results <- summary(model) # must run resulting lm() in summary() to get data similar to excel
print(results)

str(results)
results$coefficients
results$coefficients[2,4] #use [] to extract Petal.Length pvalue

unRollCo <- unlist(results$coefficients) #this does not unlist them
unRollCo[2,4]

unlist(results)$coefficients8
unlist(results)$coefficients5

##### DATA FRAMES: equal length vectors, each of which is a column

varA <- 1:12
varB <- rep(c("Con", "LowN", "HighN"), each=4)
varC <- runif(12)
dFrame <- data.frame(varA, varB, varC, stringsAsFactors = FALSE) 

## adding NEW ROW to Data Frame
newData <- list(varA=13, varB="HighN", varC= 0.668)

dFrame<- rbind(dFrame, newData) #rbind() is best tool to adad data into a table
    ## WE CANNOT USE c() because it coerced ALL of the data frames into           Characters

## adding NEW COLUMN to Data Fram

newVar <- runif(13)
dFrame <- cbind(dFrame, newVar) ##Functions the same as rbind() except for columns
#easier than rbind() because we aer adding new row, which does not neccesiate new data for the existing rowa
head(dFrame) 


### DATA FRAMES VS MATRICES

zMat<-matrix(1:30, ncol=3, byrow=T)
zFrame <- as.data.frame(zMat) # as. function "coerces" 'zMat' into a data frame

zMat[,3] 
zFrame[,3]
zFrame$V3 #can only do with data frame because columns are named

zFrame[3] #gives entireity of V3 because it is the third element
zMat[3] #gives 3rd item in the list

##### ELIMINATING NAs 

zV <- c(NA, rnorm(10), NA, rnorm(3))
complete.cases(zV) # gives logical (T/F) output for NAs, where TRUE is NOT an NA

zV[complete.cases(zV)]
which(!complete.cases(zV)) # ! gives the inverse of the function

### Eliminating NAs in Matrix

m <- matrix(1:20, nrow=5)
m[1,1] <- NA # we can use brackets to insert NA...or other data
m[3,4] <- NA
complete.cases(m) # gives logical output (T/F) as to whether WHOLE row is complete
m[complete.cases(m),] # Isolates Rows WIHTOUT NAs
m[complete.cases(m[,c(1:2)]),]

### MATRICES AND DATAFRAMES CONTINUED (1/19)

m <- matrix(data=1:12, nrow=3)

##Subsetting based on elements

##EXAMPLE:

m[1:2, ] ## Specified rows all columns
m[, 1:2] ## Specificed columns all rows

#### SUBsetting with logical statements

## EXAMPLE

colSums(m) # sums columns
colSums(m) > 15 #Can make it conditional
m[, colSums(m) > 15] ## selects columns whose sum are greater than 15
m[rowSums(m) == 22,] ## Must use "==" for logical operations
m[rowSums(m) != 22,] ## "!=" means NOT equal to

### LOCIAL OPERATORS: == != > <

## Subsetting to a vector CHANGES data type

z <- m[1,]
str(z)

z2 <- m[1, ,drop=FALSE] ## drop=FALSE allows you to subset while maintaining Matrix (instead of changing to a vector)

## Example

m2 <- matrix(data = runif(9), nrow=3)
m2[3,2]

m2[m2 > 0.6] <- NA ## Use assignment operator to substitute values

### Subsetting in DATA FRAMES
data <- iris
head(data) ## FIrst 6 rows of dataset
tail(data) ## last Six rows of dataaset

data[3,2] ## Numbered indices still work

dataSub <- data[, c("Species", "Petal.Length")]
str(dataSub)

orderIris <- iris[order(iris$Petal.Length),]  # Sort a data frame by VALUES
head(orderIris)
