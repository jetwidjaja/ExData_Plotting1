#Set your import path for the txt file
import_path <- "C:/Users/SYSA/Desktop/Coursera Project/Getting And Cleaning Data/household_power_consumption.txt"

#Import the file with only the relevant rows
data3 <- read.table(import_path, skip=66638, nrows=2879, sep=";")

#Name each column
names(data3) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Combine the Date and Time column to form a Date & Time column
data3$"Date & Time" <- paste(data3$Date, data3$Time)

#Rearrange the columns in data and remove the "Date" and "Time" column
col_order <- c("Date & Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data3 <- data3[, col_order]

#Convert the Date and Time column class in data3  
data3$`Date & Time` <- strptime(data3$`Date & Time`, format = '%d/%m/%Y %H:%M:%S')

#Plot the 1st graph with axes and add the other 2, followed by the legend
plot(data3$`Date & Time`, data3$Sub_metering_1, type='l', col='black', ylab="Energy sub metering", xlab="")
lines(data3$`Date & Time`, data3$Sub_metering_2, type='l', col='red')
lines(data3$`Date & Time`, data3$Sub_metering_3, type='l', col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)