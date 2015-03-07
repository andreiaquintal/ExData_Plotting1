#I have downloaded the data from <some URL> and have unzipped the file and placed the file <household_power_consumption.txt> in the working directory
data<- read.table(file="household_power_consumption.txt", 
header=T, 
sep=";",
dec=".", 
stringsAsFactors=FALSE,
na.strings="?" ,
colClasses=c(rep("character",2), rep("numeric",7)))

data_s<-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ),]

library(datasets)
with(data_s, hist(Global_active_power, col="red",main = "Global Active Power", xlab="Global Active Power (kilowatts)"))
title(main = "Global Active Power")
dev.copy(png, file = "plot1.png") 
dev.off() 