
wholedataset <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings ="?")

wholedataset$Date <- dmy(as.character(wholedataset$Date))
#wholedataset$Time <- hms(as.character(wholedataset$Time))

plotdata <- wholedataset[wholedataset$Date == ymd(20070201) | wholedataset$Date == ymd(20070202),]

plotdata$datetime <- paste (plotdata$Date,plotdata$Time)
plotdata$datetime <- parse_date_time(plotdata$datetime, "ymd_hms", truncated = 3)

plot(plotdata$datetime,plotdata$Global_active_power,pch = 20,type ="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="./plot2.png")
dev.off() #closing the PNG device