#Set your import path for the txt file
import_path <- "C:/Users/SYSA/Desktop/Coursera Project/Getting And Cleaning Data/household_power_consumption.txt"

#Import the file with only the relevant rows
data2 <- read.table(import_path, skip=66638, nrows=2879, sep=";")

#Name each column
names(data2) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Combine the Date and Time column to form a Date & Time column
data2$"Date & Time" <- paste(data2$Date, data2$Time)

#Rearrange the columns in data and remove the "Date" and "Time" column
col_order <- c("Date & Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data2 <- data2[, col_order]

#Convert the Date and Time column class in data2 
data2$`Date & Time` <- strptime(data2$`Date & Time`, format = '%d/%m/%Y %H:%M:%S')

#Graph the plot with the relevant labels
plot(data2$`Date & Time`, data2$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')