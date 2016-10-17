##Program for 1st assignment - Plot 2

setwd("filepath/")

powerdata<-read.csv("filepath/household_power_consumption.txt",header = TRUE, sep = ";")
powerdata1<-powerdata[which(powerdata$Date == "1/2/2007"|powerdata$Date == "2/2/2007"),]

powerdata1$datetime<-strptime(paste(powerdata1$Date, powerdata1$Time),"%d/%m/%Y %H:%M:%S")
powerdata1$Global_active_power<-as.numeric(as.character(powerdata1$Global_active_power))

plot(powerdata1$datetime,powerdata1$Global_active_power,"l",xlab = "",ylab = "Global Active Power (Kilowatts)", main = "")
dev.copy(png,file="Plot2.png")
dev.off()
