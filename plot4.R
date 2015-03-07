
setwd("C:/PERSONAL/RDIRECT/CP1")

png(file="plot4.png", bg="transparent",width = 480, height = 480)

par(mfrow = c(2, 2))

data.orig<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

data<-data.orig

data$Time<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

data$Date<-as.Date(data$Date, "%d/%m/%Y")


a<-as.Date("2007/02/01", "%Y/%m/%d")

data.vnew<-data[(data$Date==a)|(data$Date==a+1),]


##data.vnew<-data.new[!(data.new$Sub_metering_1=="?"),]
##data.vnew<-data.vnew[!(data.new$Sub_metering_2=="?"),]
##data.vnew<-data.vnew[!(data.new$Sub_metering_3=="?"),]

data.vnew$Global_active_power<-as.numeric(as.character(data.vnew$Global_active_power))

data.vnew$Voltage<-as.numeric(as.character(data.vnew$Voltage))

data.vnew$Global_reactive_power<-as.numeric(as.character(data.vnew$Global_reactive_power))


data.vnew$Sub_metering_1<-as.numeric(as.character(data.vnew$Sub_metering_1))
data.vnew$Sub_metering_2<-as.numeric(as.character(data.vnew$Sub_metering_2))
data.vnew$Sub_metering_3<-as.numeric(as.character(data.vnew$Sub_metering_3))


plot(data.vnew$Time,data.vnew$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(data.vnew$Time,data.vnew$Voltage,type="l",xlab="",ylab="Voltage")



plot(data.vnew$Time,data.vnew$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
lines(data.vnew$Time,data.vnew$Sub_metering_2,col="red")
lines(data.vnew$Time,data.vnew$Sub_metering_3,,col="blue")

legend("topright", lty=c(1,1), col = c("black","red","blue"),bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data.vnew$Time,data.vnew$Global_reactive_power,type="l",xlab="",ylab="Global_Reactive_Power")

dev.off()




