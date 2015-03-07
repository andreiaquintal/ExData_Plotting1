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
with(data_s, plot(DateTime,Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png") 
dev.off() 