##Program for 1st assignment - Plot 4

setwd("filepath/")

powerdata<-read.csv("filepath/household_power_consumption.txt",header = TRUE, sep = ";")
powerdata1<-powerdata[which(powerdata$Date == "1/2/2007"|powerdata$Date == "2/2/2007"),]

powerdata1$datetime<-strptime(paste(powerdata1$Date, powerdata1$Time),"%d/%m/%Y %H:%M:%S")
powerdata1$Global_active_power<-as.numeric(as.character(powerdata1$Global_active_power))
powerdata1$Voltage<-as.numeric(as.character(powerdata1$Voltage))
powerdata1$Global_reactive_power<-as.numeric(as.character(powerdata1$Global_reactive_power))
powerdata1$Sub_metering_1<-as.numeric(as.character(powerdata1$Sub_metering_1))
powerdata1$Sub_metering_2<-as.numeric(as.character(powerdata1$Sub_metering_2))
powerdata1$Sub_metering_3<-as.numeric(powerdata1$Sub_metering_3)

par(mfrow=c(2,2),mar=(c(4,4,1,1)),oma = c(0,0,0,0))

plot(powerdata1$datetime,powerdata1$Global_active_power,"l",xlab = "",ylab = "Global Active Power", main = "")

plot(powerdata1$datetime,powerdata1$Voltage,"l",xlab = "datetime",ylab = "Voltage", main = "")

plot(powerdata1$datetime,powerdata1$Sub_metering_1,xlab = "",ylab = "Energy Sub Metering", main = "",type = "n")
points(powerdata1$datetime,powerdata1$Sub_metering_1,"l",col="black")
points(powerdata1$datetime,powerdata1$Sub_metering_2,"l",col="red")
points(powerdata1$datetime,powerdata1$Sub_metering_3,"l",col="blue")
legend("topright",col=c("black","blue","red"),lwd = 2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5, pt.cex = 1)

plot(powerdata1$datetime,powerdata1$Global_reactive_power,"l",xlab = "datetime",ylab = "Global_reactive_power", main = "")

dev.copy(png,file="Plot4.png")
dev.off()