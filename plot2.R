
setwd("C:/PERSONAL/RDIRECT/CP1")

png(file="plot2.png", bg="transparent",width = 480, height = 480)



data.orig<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

data<-data.orig

data$Time<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

data$Date<-as.Date(data$Date, "%d/%m/%Y")


a<-as.Date("2007/02/01", "%Y/%m/%d")

data.new<-data[(data$Date==a)|(data$Date==a+1),]

data.vnew<-data.new[!(data.new$Global_active_power=="?"),]

data.vnew$Global_active_power<-as.numeric(as.character(data.vnew$Global_active_power))

plot(data.vnew$Time,data.vnew$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()




