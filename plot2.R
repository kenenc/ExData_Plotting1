#Loading in packages + reading in data + some transformation for plotting
library(tidyverse)
library(magrittr)
setwd("~/Desktop")
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
data %<>% mutate(Date = dmy(Date)) %>%
        filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02"))) %>%
        mutate(Date_Time = ymd_hms(paste(Date, Time)))

#Plot 2
png("~/Desktop/EDA_Week1_Proj1/plot2.png")

plot(data$Date_Time, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()