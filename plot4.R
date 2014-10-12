data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date<-as.character(data$Date)
data$Date<-as.Date(data$Date, "%d/%m/%Y")

data<-subset(data, data$Date>="2007-02-01" & data$Date<="2007-02-02")

for (i in 1:2880){
      time[i]<-paste(as.character(data$Date[i]),data$Time[i], sep=" ")
}
time<-as.POSIXct(time, format="%Y-%m-%d %H:%M:%S")

data<-cbind(data,time)

par(mfcol=c(2,2))

plot(data$time,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(data$time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$time, data$Sub_metering_2, col="red")
lines(data$time, data$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),lwd=1,col=c("black","red","blue"), bty="n")

plot(data$time,data$Voltage,type="l", xlab="datetime", ylab="Voltage")

plot(data$time,data$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png")
dev.off()