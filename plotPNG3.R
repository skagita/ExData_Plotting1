
wholedataset <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings ="?")

wholedataset$Date <- dmy(as.character(wholedataset$Date))
#wholedataset$Time <- hms(as.character(wholedataset$Time))

plotdata <- wholedataset[wholedataset$Date == ymd(20070201) | wholedataset$Date == ymd(20070202),]

plotdata$datetime <- paste (plotdata$Date,plotdata$Time)
plotdata$datetime <- parse_date_time(plotdata$datetime, "ymd_hms", truncated = 3)


plot(plotdata$datetime,plotdata$Sub_metering_1,type ="n",xlab ="",ylab="Energy sub metering")
lines(plotdata$datetime,plotdata$Sub_metering_1,type ="l",col = "black")
lines(plotdata$datetime,plotdata$Sub_metering_2,type ="l",col = "red")
lines(plotdata$datetime,plotdata$Sub_metering_3,type ="l",col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"),cex = 0.75)

dev.copy(png,file="./plot3.png")
dev.off() #closing the PNG device