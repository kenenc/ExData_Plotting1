#Loading in packages + reading in data + some transformation for plotting
library(tidyverse)
library(magrittr)
setwd("~/Desktop")
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
data %<>% mutate(Date = dmy(Date)) %>%
        filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02"))) %>%
        mutate(Date_Time = ymd_hms(paste(Date, Time)))

#Plot 1
png("~/Desktop/EDA_Week1_Proj1/plot1.png")

hist(as.numeric(data$Global_active_power), 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     col = "red")

dev.off()