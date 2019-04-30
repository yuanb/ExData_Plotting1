# Exploratory Data Analysis Course Project 1
# R script for creating Plot 1
# Author : yuanb
# Date : 4/26/2019

#Load dataset
columnClasses <- c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
consumption <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings = '?', colClasses = columnClasses)

#Convert first column to date time format, filter dataset for the first 2 days of February of 2007
consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")

#Create subset for the date range we will use
consumption_200702 <- subset(consumption, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#Create plot 1 
hist(consumption_200702$Global_active_power, col='red', main="Global Active Power", xlab = "Global Active Power (kilowatts)")

#save plot1 as png file
dev.copy(png, 'plot1.png', width=480, height=480)
dev.off()