# Exploratory Data Analysis Course Project 1
# R script for creating Plot 4
# Author : yuanb
# Date : 4/26/2019

#Load dataset
columnClasses <- c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
consumption <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings = '?', colClasses = columnClasses)

#Convert first column to date time format, filter dataset for the first 2 days of February of 2007
consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")

#Create subset for the date range we will use
consumption_200702 <- subset(consumption, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#combin Date and Time column
consumption_200702$DateTime <- paste(consumption_200702$Date, consumption_200702$Time, sep=' ')
consumption_200702 <- consumption_200702[,c(-1,-2)]
consumption_200702 <- consumption_200702[c(8,1,2,3,4,5,6,7)]
consumption_200702$DateTime <- as.POSIXct(consumption_200702$DateTime)

#Create plot 4
png('plot4.png', width=480, height=480)

par(mfrow = c(2,2))

#Chart 1
plot(consumption_200702$Global_active_power~consumption_200702$DateTime, type='l', xlab='', ylab='Global Active Power')

#Chart 2
plot(consumption_200702$Voltage~consumption_200702$DateTime, type='l', xlab='datetime', ylab='Voltage')

#Chart 3
plot(consumption_200702$Sub_metering_1~consumption_200702$DateTime, type='l', xlab='', ylab='Energy sub metering' )
lines(consumption_200702$DateTime, consumption_200702$Sub_metering_2, col='red')
lines(consumption_200702$DateTime, consumption_200702$Sub_metering_3, col='blue')
legend("topright", lty = 1, bty='n', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Chart 4
plot(consumption_200702$Global_reactive_power~consumption_200702$DateTime, type='l', xlab='datetime', ylab='Global_reactive_power' )

dev.off()

