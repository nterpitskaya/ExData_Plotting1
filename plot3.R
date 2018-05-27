# read data from the file
hpcall<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
# convert date to date format
 hpcall$Date<-strptime(hpcall$Date,"%d/%m/%Y")
# extract only data for Feb 1 and 2 of year 2007
hpc<-hpcall[(hpcall$Date == as.Date("2007-02-01"))|(hpcall$Date == as.Date("2007-02-02")),]
DateTime<-strptime(paste(as.character(hpc$Date),hpc$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
hpc<-cbind(DateTime,hpc)
# open png device
png("plot3.png",width = 480, height = 480, bg = "transparent")
# plot data 
plot(hpc$DateTime,hpc$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_1, col = "black")
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1, cex=0.8)
# close device
dev.off()