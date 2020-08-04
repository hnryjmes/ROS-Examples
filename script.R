setwd("~/Code/ros/ROS-Examples")
library("rprojroot")
root<-has_dirname("ROS-Examples")$make_fix_file()
library("rstanarm")
library("arm")
library("ggplot2")
library("bayesplot")
theme_set(bayesplot::theme_default(base_family = "sans"))

hibbs <- read.table(root("ElectionsEconomy/data","hibbs.dat"), header=TRUE)
head(hibbs)

plot(hibbs$growth, hibbs$vote, xlab="Average recent growth in personal income", ylab="Incumbent party's vote share")

M1 <- stan_glm(vote ~ growth, data=hibbs)

abline(coef(M1), col="gray")

print(M1)