####### ggplot2
####### 1/24/23
###### JWD


library(ggplot2)
library(ggthemes)
library(patchwork)

### TEMPLATE FOR GGPLOT CODE

### ggplot(data=<DATA HERE>, mapping = aes(x = xVAR, y = yVAR)) + <GEOM FUNCTION>
    ###print(p1)
     ##GEOM FUNCTION specify the type of plot you watn to  create (ie bar, scatter,        pie, etc)

#################### EXAMPLES #################### 

data(mpg)
d<-mpg

str(d)
library(dplyr)
glimpse(d)


#### QUICKPLOTS #####
  ## qplot: used for "quick plotting"

qplot(x=d$hwy)

qplot(x=d$hwy, fill= I("magenta"), color=I("black")) ### I() needed to recongze color

### SCATTERPLOTS:

qplot(x=d$displ, y=d$hwy, geom=c("smooth", "point"), method="lm") ### Command for scatter with linear line of best fit

## BOXPLOTS

qplot(x=d$fl, y=d$cty, geom="boxplot")

### BAR PLOTS

qplot(x=d$fl, geom="bar", fill=I("lavender"), color=I("black"))

### CREATING SOME DATA

x_trt<- c("Control", "Low", "high")
y_rest<- c(12, 2.5, 22.9)
qplot(x=x_trt, y=y_rest, geom = "col", fill=I(c("green", "gray", "gold")))


############ ggplot: USES DFRAMES INSTEAD OF VECTORS ####

p1<-ggplot(data=d, mapping=aes(x=displ, y=cty, color = cyl)) + 
  geom_point()#### color= delegates color by variable
p1

p1+theme_base()### can add to plot once the "base" version is saced as "Data"
### theme_<style> provides a number of different plot styles


p1+theme_bw(base_size=20, base_family="serif")

p2<- ggplot(data=d, aes(x=fl, fill=fl))+ 
  geom_bar()
p2
p2+coord_flip()### Command to rotate axis
p2+coord_flip()+theme_classic(base_size=15, base_family="sans")


##### ADDITONAL THEME MODIFICATIONS

p3<- ggplot(data=d, aes(x=displ, y=cty))+
  geom_point(size=6, shape=42, color="black", fill="cyan") + 
  xlab("Count") +
  ylab("Fuel") + 
  labs(title="The Glorious Graph", subtitle="b00b13z") 
p3
p3+xlim(1, 10) + ylim(8, 36)

library("viridis")
cols<-viridis(7, option="magma")
ggplot(data=d, aes(x=class, y=hwy, fill=class)) +
  geom_boxplot()+
  scale_fill_manual(values=cols)

### MULTI PANEL FIGURES

library(patchwork)
(p1/p2)+p3
