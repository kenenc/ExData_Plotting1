#Loading in packages + reading in data + some transformation for plotting
library(tidyverse)
library(magrittr)
setwd("~/Desktop")
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
data %<>% mutate(Date = dmy(Date)) %>%
        filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02"))) %>%
        mutate(Date_Time = ymd_hms(paste(Date, Time)))

#Plot 3
png("~/Desktop/EDA_Week1_Proj1/plot3.png")

plot(data$Date_Time, data$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")
lines(data$Date_Time, data$Sub_metering_1)
lines(data$Date_Time, data$Sub_metering_2, col = "red")
lines(data$Date_Time, data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1,
       col = c("black", "red", "blue"))

dev.off()