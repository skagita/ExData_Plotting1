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

# Construct the plot
plot(plotdata$datetime,plotdata$Global_active_power,pch = 20,type ="l",xlab="",ylab="Global Active Power (kilowatts)")

# Copy the plot on screen to PNG file
dev.copy(png,file="./plot2.png")

# Close the device
dev.off() #closing the PNG device