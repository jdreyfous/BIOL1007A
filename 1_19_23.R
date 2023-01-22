#### NOTES 1/19
### JWD


### USER DEFINED FUNCTIONS

##    functionNameHere <- function(argX=defaultX, argY=defaultY){}
### {} start the body of the functin
## Lines of R code ## and Notes
### Creates local variables (only 'visible' to R within the function)
  ## return(z) ; if you return a variable you have to SAVE OUTSIDE FUNCTION to access variable elsewhere

myFunc <- function(a=3, b=4){
  z<- a+b
  return(z)
}
myFunc(a=100, b=3.4) #if blank, function runs default values
# ALWAYS include all variables when defining functions
## can make varaibles NULL if you do not want a default value

#### MULTIPLE RETURN STATEMENTS

###############################

# Function: HardyWeinberg
# input: all allele frequency p(0,1)
# output: p and the frequencies of 3 genotypes (AA, AB, BB)
#------------------------------
Hardy <- function(p = runif(1)){
  if(p > 1.0 | p < 0){
    return("Function failure: p must be between 0 and 1")
  }
 q = 1-p
 fAA <- p^2
 fAB <- 2*p*q
 fBB <- q^2
 vecOut <- signif(c(p=p, AA=fAA, AB= fAB, BB = fBB), digits=3)
 return(vecOut)
}
Hardy()
##############################
Hardy()
freqs <- Hardy()
freqs
Hardy(p=3)

### CREATE Complex default value

####################################

# FUNCTION: fintLine2
# Fits simple regression line
# input: numeric list(p) of predictor (x) and response (y)
# output: slope and p-value

fitLine2 <- function(p=NULL){
  if(is.null(p)){
    p <- list(x=runif(20), y=runif(20))
  }
  myMod <- lm(p$x~p$y)
  myOut <- c(slope = summary(myMod)$coefficients[2,1], 
             pValue=summary(myMod)$coefficients[2,4])
  plot(x=p$x, y=p$y) # quick plot to check output
  return(myOut)
}
fitLine2()

myPars<- list(x=1:10, y=runif(10))
fitLine2(p=myPars)
