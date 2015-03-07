
setwd("C:/PERSONAL/RDIRECT/CP1")

png(file="plot1.png", bg="transparent",width = 480, height = 480)



data.orig<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

data<-data.orig

data$Date<-as.Date(data$Date, "%d/%m/%Y")

data$Time<-strptime(data$Time, "%H:%M:%S")

a<-as.Date("2007/02/01", "%Y/%m/%d")

data.new<-data[(data$Date==a)|(data$Date==a+1),]

data.vnew<-data.new[!(data.new$Global_active_power=="?"),]

data.vnew$Global_active_power<-as.numeric(as.character(data.vnew$Global_active_power))

hist(data.vnew$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")


dev.off()




