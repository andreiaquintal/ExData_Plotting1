#I have downloaded the data from <some URL> and have unzipped the file and placed the file <household_power_consumption.txt> in the working directory
data<- read.table(file="household_power_consumption.txt", 
header=T, 
sep=";",
dec=".", 
stringsAsFactors=FALSE,
na.strings="?" ,
colClasses=c(rep("character",2), rep("numeric",7)))

data_s<-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ),]

Sys.setlocale("LC_TIME", "English")
data_s$DateTime<-as.POSIXct(strptime(paste(data_s$Date,data_s$Time),"%d/%m/%Y %H:%M:%S"))

library(datasets) 
plot(data_s$DateTime,data_s$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data_s$DateTime,data_s$Sub_metering_2,type="l",col="red")
lines(data_s$DateTime,data_s$Sub_metering_3,type="l",col="blue")
legend("topright", lwd=0,col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png") 
dev.off() 