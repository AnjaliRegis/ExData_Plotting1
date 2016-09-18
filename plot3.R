data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE,dec=".")

subSetData <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)


png("plot3.png", width=480, height=480)


plot(datetime,Sub_metering_1,type="l",  ylab="Energy Sub metering",xlab="")
lines(datetime,Sub_metering_2,type="l",col="red")
lines(datetime,Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2.5)

dev.off()
