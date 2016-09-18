data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE,dec=".")

subSetData <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSetData$Global_active_power)

Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

Voltage <- as.numeric(subSetData$Voltage)

Global_Reactive_Power<-as.numeric(subSetData$Global_reactive_power)

png("plot4.png", width=480, height=480)

##--------- Par function
par(mfcol=c(2,2))


#----------Plot1
plot(datetime,globalActivePower,type="l",  ylab="Global Active Power (kilowatts)",xlab="")

##----------Plot2

plot(datetime,Sub_metering_1,type="l",  ylab="Energy Sub metering",xlab="")
lines(datetime,Sub_metering_2,type="l",col="red")
lines(datetime,Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2.5)

##--------Plot3

plot(datetime,Voltage,type="l",ylab="Voltage",xlab="datetime")

##-------Plot4

plot(datetime,Global_Reactive_Power,type="l")



dev.off()
