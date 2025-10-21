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
#Visually, the graph for participants in group 1 shows that the median is about
#65. Also, we can see that there are two outliers below the minimum value. For 
#group 2, the median seems to be about 68. Meanwhile, there are no outliers. 
#Group 1 is left skewed, this means that participants fall mostly towards the
#values below the median. Thus, for group 2, it is right skewed, so the value 
#for the paricipant mostly goes above the median. 



