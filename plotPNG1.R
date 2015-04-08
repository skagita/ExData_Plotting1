# Course Project -1 Exploratory Data Analysis
# Purpose of this project is to construct plots using base the plotting system.

# Load the required packages.'lubridate' package is used to work with Date/Time variables.
library(lubridate) 

# Load the entire data from the text file located in your working directory.
wholedataset <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings ="?",stringsAsFactors=FALSE)

# Format the Date and Time columns to POSIXct(Date-Time Class)
wholedataset$Date <- dmy(as.character(wholedataset$Date))
wholedataset$Time <- hms(as.character(wholedataset$Time))

# Subset only the required data. 
plotdata <- wholedataset[wholedataset$Date == ymd(20070201) | wholedataset$Date == ymd(20070202),]

# Set plot parameters
par(mfrow = c(1,1))

# Plot a histogram
hist(plotdata$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

# Copy the plot on screen to PNG file
dev.copy(png,file="./plot1.png")

# Close the device
dev.off() #closing the PNG device