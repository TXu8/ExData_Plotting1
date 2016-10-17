##Program for 1st assignment - Plot 3

setwd("filepath/")

powerdata<-read.csv("filepath/household_power_consumption.txt",header = TRUE, sep = ";")
powerdata1<-powerdata[which(powerdata$Date == "1/2/2007"|powerdata$Date == "2/2/2007"),]

par(mfrow=c(1,1))
powerdata1$datetime<-strptime(paste(powerdata1$Date, powerdata1$Time),"%d/%m/%Y %H:%M:%S")
powerdata1$Sub_metering_1<-as.numeric(as.character(powerdata1$Sub_metering_1))
powerdata1$Sub_metering_2<-as.numeric(as.character(powerdata1$Sub_metering_2))
powerdata1$Sub_metering_3<-as.numeric(powerdata1$Sub_metering_3)

plot(powerdata1$datetime,powerdata1$Sub_metering_1,xlab = "",ylab = "Energy Sub Metering", main = "",type = "n")
points(powerdata1$datetime,powerdata1$Sub_metering_1,"l",col="black")
points(powerdata1$datetime,powerdata1$Sub_metering_2,"l",col="red")
points(powerdata1$datetime,powerdata1$Sub_metering_3,"l",col="blue")
legend("topright",col=c("black","blue","red"),lwd = 2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="Plot3.png")
dev.off()
