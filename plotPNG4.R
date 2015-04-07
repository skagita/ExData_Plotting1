
wholedataset <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings ="?")

wholedataset$Date <- dmy(as.character(wholedataset$Date))
#wholedataset$Time <- hms(as.character(wholedataset$Time))

plotdata <- wholedataset[wholedataset$Date == ymd(20070201) | wholedataset$Date == ymd(20070202),]

plotdata$datetime <- paste (plotdata$Date,plotdata$Time)
plotdata$datetime <- parse_date_time(plotdata$datetime, "ymd_hms", truncated = 3)

par(mfrow = c(2,2))
par(cex.lab = 0.75)

plot(plotdata$datetime,plotdata$Global_active_power,pch = 20,type ="l",xlab="",ylab="Global Active Power")
plot(plotdata$datetime,plotdata$Voltage,type ="l",xlab="datetime",ylab="Voltage")

plot(plotdata$datetime,plotdata$Sub_metering_1,type ="n",xlab ="",ylab="Energy sub metering")
lines(plotdata$datetime,plotdata$Sub_metering_1,type ="l",col = "black")
lines(plotdata$datetime,plotdata$Sub_metering_2,type ="l",col = "red")
lines(plotdata$datetime,plotdata$Sub_metering_3,type ="l",col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"),cex = 0.65,bty ="n")

plot(plotdata$datetime,plotdata$Global_reactive_power,type ="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,file="./plot4.png")
dev.off() #closing the PNG device