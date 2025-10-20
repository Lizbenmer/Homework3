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

#Bar plot LBM  (9, 16 )
ggplot(text, aes(x=value)) + geom_bar()


### Stats ###

