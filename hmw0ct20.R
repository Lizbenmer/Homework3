setwd("/cloud/project")

textMessages <- read.csv("TextMessages.csv", header=TRUE)

table(TextMessages$Group)

install.packages("reshape")

library(reshape)

text <- melt(TextMessages, id=c("Participant","Group"), measured=c("Baseline","Six_months"))

text$Group <- as.factor(text$Group)
install.packages("ggplot2")

library(ggplot2)

ggplot(text,aes(x=Group,y=value)) + geom_boxplot()

#barchart

# Install if not already installed
install.packages("tidyverse")


library(tidyverse)



text<- read.csv("TextMessages.csv", header=TRUE)
install.packages("reshape")

library(reshape)


# Reshape and assign to 'text'

text <- textpivot_longer(cols = c(Baseline, Six_months),   
               names_to = "time",                
               values_to = "Score" )



# Mean score by time & group
ggplot(text, aes(x = Baseline, y = Six_months, fill = as.factor(Group))) +
  stat_summary(fun = "mean", geom = "bar", position = position_dodge(width = 0.7)) +
  stat_summary(fun.data = mean_se, geom = "errorbar", 
               position = position_dodge(width = 0.7), width = 0.2) +
  labs(title = "Average Score by Text ",
       x = "Baseline",
       y = "Six_months",
       fill = "Group") +
  theme_minimal(12)









