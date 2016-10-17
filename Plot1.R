##Program for 1st assignment - Plot 1

setwd("filepath/")

powerdata<-read.csv("filepath/household_power_consumption.txt",header = TRUE, sep = ";")
powerdata1<-powerdata[which(powerdata$Date == "1/2/2007"|powerdata$Date == "2/2/2007"),]

powerdata1$Global_active_power<-as.numeric(as.character(powerdata1$Global_active_power))

hist(powerdata1$Global_active_power,col="red",xlab = "Global Active Power (Kilowatts)",ylab="Frequency",main="Global Active Power")
dev.copy(png,file="Plot1.png")
dev.off()
