data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date<-as.character(data$Date)
data$Date<-as.Date(data$Date, "%d/%m/%Y")

data<-subset(data, data$Date>="2007-02-01" & data$Date<="2007-02-02")

for (i in 1:2880){
      time[i]<-paste(as.character(data$Date[i]),data$Time[i], sep=" ")
}
time<-as.POSIXct(time, format="%Y-%m-%d %H:%M:%S")

data<-cbind(data,time)

plot(data$time,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()