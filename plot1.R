library(ggplot2)

#Set your import path for the txt file
import_path <- "C:/Users/SYSA/Desktop/Coursera Project/Getting And Cleaning Data/household_power_consumption.txt"

#Import the file with only the relevant rows
data <- read.table(import_path, skip=66638, nrows=2879, sep=";")

#Name each column
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Get the frequency for each "Global_active_power" value
frequency_gap <- table(data$Global_active_power)

#Plot the histogram with the main title, x and y labels.
hist(data$Global_active_power, frequency_gap, col="red", breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
