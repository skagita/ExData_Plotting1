# Course Project -1 Exploratory Data Analysis
# Purpose of this project is to construct plots using base the plotting system.

# Load the required packages.'lubridate' package is used to work with Date/Time variables.
library(lubridate)

# Load the entire data from the text file located in your working directory.
wholedataset <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings ="?",stringsAsFactors=FALSE)

# Format the Date column to POSIXct(Date-Time Class)
wholedataset$Date <- dmy(as.character(wholedataset$Date))

# Subset only the required data. 
plotdata <- wholedataset[wholedataset$Date == ymd(20070201) | wholedataset$Date == ymd(20070202),]

# Combine Date & time columns into a datetime column
plotdata$datetime <- paste (plotdata$Date,plotdata$Time)
plotdata$datetime <- parse_date_time(plotdata$datetime, "ymd_hms", truncated = 3)

# Set plot parameters
par(mfrow = c(1,1))

# Construct an empty plot first
plot(plotdata$datetime,plotdata$Sub_metering_1,type ="n",xlab ="",ylab="Energy sub metering")

# Add individual plots one by one
lines(plotdata$datetime,plotdata$Sub_metering_1,type ="l",col = "black")
lines(plotdata$datetime,plotdata$Sub_metering_2,type ="l",col = "red")
lines(plotdata$datetime,plotdata$Sub_metering_3,type ="l",col = "blue")

# Add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"),cex = 0.75)

# Copy the plot on screen to PNG file
dev.copy(png,file="./plot3.png")

# Close the device
dev.off() #closing the PNG device