# read data from the file
hpcall<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
# convert date to date format
 hpcall$Date<-strptime(hpcall$Date,"%d/%m/%Y")
# extract only data for Feb 1 and 2 of year 2007
hpc<-hpcall[(hpcall$Date == as.Date("2007-02-01"))|(hpcall$Date == as.Date("2007-02-02")),]
DateTime<-strptime(paste(as.character(hpc$Date),hpc$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
hpc<-cbind(DateTime,hpc)
# open png device
png("plot4.png",width = 480, height = 480, bg = "transparent")
# plot data 
par(mfrow = c(2,2),mar = c(4,4,2,1), cex.lab=0.8,cex.axis=0.8)
plot(hpc$DateTime,hpc$Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "")
plot(hpc$DateTime,hpc$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(hpc$DateTime,hpc$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_1, col = "black")
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1, cex=0.8,bty="n")
plot(hpc$DateTime,hpc$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
# close device
dev.off()