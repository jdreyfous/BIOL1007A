############# ENTERING THE TIDYVERSE#
####### 1/23/23
####


#### WHAT IS THE TIDYVERSE?: collection of packages that share philosophy, grammar (or how the code is structured), and data structures

### OPERATORS: symbols that tell R to perform different operations (between variable, functions, etc.)

    ### Arithmetic operators: + - * / ^ ~
    ### Assignment Operator: <-
    ### Logical Operators: !(not) &(and) |(or)
    ### Relational Operators: ==, !=, >, <, <=, >=
    ### Miscellaneous Operators:
        ## %>%: Forward pipe operator
        ## %in%: 

### INSTALLING PACKAGES: 
  # Only need to Install ONCE
library(tidyverse) ## library() to load in packages

## TIDYVERSE PACKAGES:

## The FIVE CORE verbs:
  ## filter()
  ## arrange()
  ## select()
  ## group_by() and summarize ()
  ## mutate()

  

# dplyr: new(er) packages provides a set of tools for manipulating data sets
  # specifically written to be fast
  # individual functions that correspond to common operations

## Tibble: modernized data frame made it be easier and more intuitive

## filter(): picks/subsets observations (ROWS) by their values

## arrange(): reorders rows

## %in% operator: matching operator that allows you to compare vectors of DIFFERNT  lengths

## select(): chooses variables (columns) by name

## muatate(): creates new variables using functions of existing variables
  # transmute()

## group_by() and summarize():
  # can be used seperately but is EASIER to use together

## Piping: %>% "pipes" output from one function to the next
  # used to emphasize a sequence of actions
  # allows you to pass an intermediate result on the next functtion (uses output on one     function as input of the next function)
  # AVOID IF: manipulat more than one object at a time; or if the variable is of importance
      # Formatting: ALWAYS space before the %>% followed by NEW LINE

##EXAMPLEs WITH COMMANDS 
data(starwars)
class(starwars)

glimpse(starwars) ##cleaner summary than str(); package embedded in dplyr

anyNA(starwars) # command to search for NAs

starwarsClean<- starwars[complete.cases(starwars[,1:10]), ] ## gives a a complete list of the first ten ROWS of the starwars data set without NAs

filter(starwarsClean, gender == "masculine" & height <180 & height>100) ## ',' and '&' are equivalent
  
a<- LETTERS[1:10]
length(a) #number of elements in teh vector
b<-LETTERS[4:10]
length(b)

a %in% b ## output in %in% depends on the first vector (ie what elements in a are in b)

eyes<-filter(starwars, eye_color %in% c("blue", "brown")) ## using %in% to SUBSET
View(eyes) #View() opens table in new tab 

arrange(starwarsClean, by=height) ## default is in ascending order
 arrange(starwarsClean, by=desc(height)) #can use desc() to 

sw<-arrange(starwars, height, desc(mass)) ## second variable used to arrange in the instance of ties

tail(sw) #shows last 6 rows of dataset...NAs are always at the end of dataset

select(starwarsClean, 1:10) #isolated first ten COLUMNS of data set

select(starwarsClean, name:species)
select(starwarsClean, -(films:starships))

select(starwarsClean, name, gender, species, everything()) #rearranges columns with everything() putting non-selected variables at bottom; USEFUL if you have a couple variable you want to move to beggining 

select(starwarsClean, contains("color")) # contains() selects all columns with the word "color"

# helper functions for select(); ends_with(), starts_with, num_range

select(starwarsClean, haircolor = hair_color) # renaming columns option 1 (returns renamed column)

rename(starwarsClean, haircolor=hair_color) #option 2: returns whole data frame

mutate(starwarsClean, ratio=height/mass)  # Creating new column in data set using mutate()

starwars_lbs<-mutate(starwarsClean, mass_lbs=mass*2.2)
View(starwars_lbs)

starwars_lbs<-select(starwars_lbs, 1:3, mass_lbs, everything()) ## reorders ata set so first three columns remain (1:3), then mass_lbs, then everyhting else)
glimpse(starwars_lbs)

transmute(starwarsClean, mass_lbs=mass*2.2) ## Only returns mutated columns

transmute(starwarsClean, mass, mass_lbs=mass*2.2, height) #returns mutated column and recognizes place of other columns

summarize(starwarsClean, meanHeight=mean(height)) ## summarizes and puts out value of designated function
summarize(starwarsClean, meanHeight=mean(height, TotalNumber= n())

starwarsG<-group_by(starwars, gender) ## use group-by first to create a variable and then summarize that function
head(starwarsG)

summarize(starwarsG, meanHeight=mean(height, na.rm=TRUE), TotalNumber=n()) ##na.rm ignores NAs

starwarsClean %>% 
  group_by(gender) %>% 
  summarize(meanHeight=mean(height, na.rm=T), TotalNumber=n())

## HElper Function case_when() : is useful when using MULTIPLE if statements
starwarsClean %>% 
  mutate(sp = case_when(species=="Human"~"Human", TRUE~"Non-Human"))
View(starwarsClean)
