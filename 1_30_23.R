###### Simple Data Analysis and More Complex Control structures

dryad<-read.table(file="powell_data.csv", header=T, sep=',')

## Set up libraries

library(tidyverse)
library(ggthemes)

### ANALYSES
### EXPERIMENTAL DESIGNS
### 

### Cont. vs Conti = regression analyses
  ## Continuous variables (range of numbers) vs dicrete/categorical variables (categories: speceies, treatments, site)

## Cont. vs Categorical: t-test (ANOVA)...best for use with box plots and bar      graphs    (box plot better because more informative)

### Cate vs Cate: chi-squared (vount data), table or "mosaic plot" is best

### Categ vs Cont: logistical regression 

glimpse(dryad)

## Basic Linear Regression (2x continuous variables)  

## EXAMPLE: relationship between mean poool hydroperiod and breeding frogs caught?

regModel<- lm(count.total.adults~mean.hydro, data=dryad) # lm() menas linear model
  print(regModel)
  summary(regModel) ## Summary tables of analyses
  hist(regModel$residuals) ## histogram
  summary(regModel)$"r.squared"
 ## View(summary(regModel))
  
## SCATTERPLOT EXAMPLE
  
  regPlot<- ggplot(data=dryad, aes(x=mean.hydro, y=count.total.adults))+
      geom_point()+
      stat_smooth(method=lm, se=0.99)
  regPlot+theme_few()

### BASIC ANOVA for SCATTERPLOT
  #Sig. relationshion in # adults across different wetlands
  #y~x
  Anova<- aov(count.total.adults~factor(wetland), data=dryad)
summary(Anova)  


dryad%>% 
  group_by(wetland)%>%
  summarise(avgHydro= mean(count.total.adults, na.rm=T), N=n())

### BOXPLOT ANOVA

dryad$wetland<-factor(dryad$wetland)
AnoPlot<- ggplot(data=dryad, mapping=aes(x=wetland, y=count.total.adults, fill=species))+
    geom_boxplot()+
  scale_fill_grey()
AnoPlot

ggsave(file="dryadBoxPlot.pdf", plot=AnoPlot, device="pdf") ## save plot to files 


### Logistic Regression EXAMPLE
## Data Frame

xVar<- sort(rgamma(n=200, shape=5, scale=5)) ## "gamma" probabilities are est for continuous variables that are always positive and have a skewed distribution
xVar
yVar<-sample(rep(c(1,0), each=100), prob=seq_len(200))
yVar
LogReg<- data.frame(xVar, yVar)
glimpse(LogReg)

## Logistic Regression Analysis

logRegModel<- glm(yVar~xVar, 
                  data=LogReg, family=binomial(link=logit)) ## link=logit means logistic regression
summary(logRegModel)

logPlot<- ggplot(data=LogReg, mapping=aes(x=xVar, y=yVar))+ 
  geom_point()+
  ##method.args=list(family=binomial) consistent for logistical regressions
logPlot

### CONTINGENCY TABLES AND CHI-SQUARED ANALYSIS
  #Differneces in males and females between speceis??

countData<-dryad%>% 
  group_by(species)%>% 
  summarize(Males=sum(No.males, na.rm=T), Females=sum(No.females, na.rm=T)) %>% 
  select(-species)%>% as.matrix()
countData
row.names(countData)= c("SS", "WF")
countData

## CHI_SQUARED

chisq.test(countData)$residuals ### RESIDUALS arae how far off from "normal" the distribution is

### MOSAIC PLOTS

mosaicplot(x=countData, col=c('goldenrod', "grey"), shade=F)

### BAR PLOTS 
countDataLong<- countData%>% 
  as_tibble()%>% 
  mutate(Species=c(rownames(countData)))%>% 
  pivot_longer(cols= Males:Females, 
               names_to = "Sex", 
               values_to="Count")
countDataLong

bar<-ggplot(data=countDataLong, mapping=aes(x=Species, y=Count, fill=Sex))+
  geom_bar(stat="identity", position="dodge")+
  scale_fill_manual(values=c("darkslategrey", "midnightblue"))
  bar
  
  
###################### CONTROL STRUCTURES #################################
  
  ### if and ifelse statements
    ## Strucutres: if(<condition>){<expression1>}
      #if(<condition>){<expression1} else {expression2} 
  
  ### if(condition1){expression1} else if(condition2){expression2} else # any "unspecified 'elses' " captures the rest of unspecified conditions
  #else msut appear on SAME LINE as the expression
  
  # use it for SINGLE VALUESS
  
  z<- 0.5
z  

if(z>0.8) {cat(z, "is a large number", "\n")} else 
  if (z<0.4) {cat(z, "is a small number", "\n")} else
    {cat(z, "is a average sized number", "\n" )
    cat("z^2=", z^2, "\n")
    y<-cat(T)}

######### IFELSE(): USED TO FILL VECTORS

## ifelse(condition, yes<expression>, no<expression>)

## Insects lay 10.2 eggs on average, and follows Poisson distribution (discrete probability distribution showing the likely number of times an event will occur). 35% of insects are parasatized and no eggs are laid. Make a distirubtion for 1000 indiviudals

tester<- runif(1000)
eggs<-ifelse(tester>0.35, rpois(n=1000, lambda = 10.2), 0)
hist(eggs)


### Vector of p-vals from a simulation...we want to create a VECTOR to highlight the significant one for plotting

pVals<- runif(1000)
z<- ifelse(pVals<= 0.025, "lowerTail", "nonSig")
z
z[pVals>=0.975]<-"upperTail"
table(z)


######### FOR LOOPS ############
## Function designed for doing repetitive tasks
  #UNIVERSAL in ALL computer languages
  #Necessary for "vectorization" in R
  # very slow with certaion operations

## Anatomy of for loop
### for(variable in sequence){#starts for loop
#body of for loop
#END}     

#Variable in sequence is a "counter" that holds the current value of the loop (i,j,k standard)

# sequenec is an integer vector that defines start/end of loop

## EXAMPLE with SINGLE for loop

for(i in 1:5){cat("stuck in a loop", i, "\n")
cat(3+2, "\n")
cat(3+i, "\n")
}


print(i) #i will print as last number in sequence


## Use a counter variable that maps to the position of each element

Dogs<-c("chow", "akita", "malamute", "husky", "samoyed") 
for(i in 1:length(Dogs)){cat("i=", i, "Dogs[i]=", Dogs[i], "\n"
)
}


### use DOUBLE for loops #######

m<-matrix(round(runif(20), digits=2), nrow=5)
m
for(i in 1:nrow(m)) {
  m[i,] <- m[i,]+i
}
m

for(j in 1:ncol(m)){
  m[,j]<- m[,j]+j
}
m

#### loop rows AND columns#3
m<-matrix(round(runif(20), digits=2), nrow=5)
m
for(i in 1:nrow(m)){
  for(j in 1:ncol(m)){
    m[i,j]<- m[i,j]+i+j
  }
}
m
