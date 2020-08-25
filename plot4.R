#Import the file with only the relevant rows
data4 <- read.table(import_path, skip=66638, nrows=2879, sep=";")

#Name each column
names(data4) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Combine the Date and Time column to form a Date & Time column
data4$"Date & Time" <- paste(data4$Date, data4$Time)

#Rearrange the columns in data and remove the "Date" and "Time" column
col_order <- c("Date & Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data4 <- data4[, col_order]

#Convert the Date and Time column class in data4 
data4$`Date & Time` <- strptime(data4$`Date & Time`, format = '%d/%m/%Y %H:%M:%S')

#Arrange the 4 plots in a 2x2 configuration
par(mfrow=c(2,2))

#Plot the 1st graph
plot(data4$`Date & Time`, data4$Global_active_power, type='l', xlab='', ylab='Global Active Power')

#Plot the 2nd graph
plot(data4$`Date & Time`, data4$Voltage, type="l", xlab='datetime', ylab='Voltage' )

#Plot the 3rd graph
plot(data4$`Date & Time`, data4$Sub_metering_1, type='l', col='black', ylab="Energy sub metering", xlab="")
lines(data4$`Date & Time`, data4$Sub_metering_2, type='l', col='red')
lines(data4$`Date & Time`, data4$Sub_metering_3, type='l', col='blue')
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

#Plot the 4th graph
plot(data4$`Date & Time`, data4$Global_reactive_power, type='l', col='black', xlab='datetime', ylab='Global_reactive_power')