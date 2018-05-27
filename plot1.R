# read data from the file
hpcall<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
# convert date to date format
hpcall$Date<-strptime(hpcall$Date,"%d/%m/%Y")
# extract only data for Feb 1 and 2 of year 2007
hpc<-hpcall[(hpcall$Date == as.Date("2007-02-01"))|(hpcall$Date == as.Date("2007-02-02")),]
# open png device
png("plot1.png",width = 480, height = 480, bg = "transparent")
# plot data 
hist(hpc$Global_active_power, col = "red", main = "Global active power", xlab = "Global active power(kilowatts)")
# close device
dev.off()