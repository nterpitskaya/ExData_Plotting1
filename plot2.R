# read data from the file
hpcall<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
# convert date to date format
 hpcall$Date<-strptime(hpcall$Date,"%d/%m/%Y")
# extract only data for Feb 1 and 2 of year 2007
hpc<-hpcall[(hpcall$Date == as.Date("2007-02-01"))|(hpcall$Date == as.Date("2007-02-02")),]
DateTime<-strptime(paste(as.character(hpc$Date),hpc$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
hpc<-cbind(DateTime,hpc)
# open png device
png("plot2.png",width = 480, height = 480, bg = "transparent")
# plot data 
plot(hpc$DateTime,hpc$Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "")
# close device
dev.off()