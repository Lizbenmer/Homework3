#This 
setwd("/cloud/project")

TextMessages <- read.csv("TextMessages.csv", header=TRUE)

table(TextMessages$Group)

install.packages("reshape")

library(reshape)

text <- melt(TextMessages, id=c("Participant","Group"), measured=c("Baseline","Six_months"))

text$Group <- as.factor(text$Group)
#install.packages("ggplot2")

library(ggplot2)

ggplot(text,aes(x=Group,y=value)) + geom_boxplot()
#NOTES: In Group 1, There are a couple of outliers. The data looks normally
#distributed. My 25th percentile is about 53 a.....

###############Desc.Stats with RESHAPE data ###############
#Install Pastecs package to run stats.
install.packages("pastecs")
library(pastecs)
#

#Here, I used the reshaped data "text" to obtain summary statistics on value 
#by Group 
by(text$value, text$Group, stat.desc)
#This one is value by variable (time)
by(text$value, text$variable, stat.desc)

###############Desc. Stats with ORIGINAL data #############
#In this process, I used the Original data "TextMessages" to obtain summary
#statistics on Time (Baseline) by Group
by(TextMessages$Baseline, TextMessages$Group, stat.desc)

#Ran stats on Original data "TextMessages" to obtain summary statistics on
#Time(Six_monts) by Group
by(TextMessages$Six_months, TextMessages$Group, stat.desc)



