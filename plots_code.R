#Exploratory Data Analysis Course (Data Science Specialization): Week 1 Course Project 1
#By: Kenen Corea

#Loading in packages + reading in data
library(tidyverse)
library(magrittr)
setwd("~/Desktop")
data <- read.table("household_power_consumption.txt", sep = ";", header = T)

#Changing date column to date format
data %<>% mutate(Date = dmy(Date))

#Filtering data to only between dates 2007-02-01 and 2007-02-02
data %<>% filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))