
wholedataset <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings ="?")

wholedataset$Date <- dmy(as.character(wholedataset$Date))
wholedataset$Time <- hms(as.character(wholedataset$Time))

plotdata <- wholedataset[wholedataset$Date == ymd(20070201) | wholedataset$Date == ymd(20070202),]

dev.off() # clearing prior plot history
hist(plotdata$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="./plot1.png")
dev.off() #closing the PNG device