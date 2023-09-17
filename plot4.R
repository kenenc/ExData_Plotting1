#Loading in packages + reading in data + some transformation for plotting
library(tidyverse)
library(magrittr)
setwd("~/Desktop")
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
data %<>% mutate(Date = dmy(Date)) %>%
        filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02"))) %>%
        mutate(Date_Time = ymd_hms(paste(Date, Time)))

#Plot 4
png("~/Desktop/EDA_Week1_Proj1/plot4.png")

par(mfrow = c(2,2), mar = c(5,5,3,3))

#Top Left
plot(data$Date_Time, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power") 

#Top Right
plot(data$Date_Time, as.numeric(data$Voltage),
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

#Bottom Left
plot(data$Date_Time, data$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")
lines(data$Date_Time, data$Sub_metering_1)
lines(data$Date_Time, data$Sub_metering_2, col = "red")
lines(data$Date_Time, data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n",
       cex = 0.5,
       lwd = 1,
       col = c("black", "red", "blue"))

#Bottom Right
plot(data$Date_Time, data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power",)

dev.off()

