data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date<-as.character(data$Date)
data$Date<-as.Date(data$Date, "%d/%m/%Y")

data<-subset(data, data$Date>="2007-02-01" & data$Date<="2007-02-02")

hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()