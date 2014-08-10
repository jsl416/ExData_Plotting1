###################################################################################
## Courseproject 1
## for plot 4
## Written by: Lee, JungSoo
## (2014-08-10~08-11)
###################################################################################

# To download original data from the web
Original_DataURL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Original_DataURL, destfile="Original_Data.zip")

# Check Zip file name.
Data_Names <- unzip("Original_Data.zip", list=TRUE)$Name[1]

# Set the working directory location
working_directory <- getwd()

# Extract the zipped file.
unzip("Original_Data.zip", files=Data_Names, exdir=working_directory , overwrite=TRUE)

# Read the data.
data <- read.table(Data_Names, stringsAsFactors = FALSE, sep=";", header=T, na.strings="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
to_use_data <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
str(to_use_data)

## Dataset completed for plotting
to_use_data$Date <- strptime(paste(to_use_data$Date,to_use_data$Time), "%Y-%m-%d %H:%M:%S")
str(to_use_data$Date)
str(to_use_data)

## Dataset completed for plotting. Above codes are common to plotting graphs for course project 1
#############################################################################################
## Draw graph for plot4
# Sys.setlocale("LC_TIME", "en_US") 
Sys.setlocale("LC_TIME", "English") 

png(file="plot4.png", width=480, height=480, units = 'px')
par(mfcol=c(2,2))
plot(to_use_data$Date, to_use_data$Global_active_power, xlab="", ylab="Global Active Power", type="l")

plot(to_use_data$Date, to_use_data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", oma = 2)
points(to_use_data$Date, to_use_data$Sub_metering_1, type = "l")
points(to_use_data$Date, to_use_data$Sub_metering_2, type = "l", col="red")
points(to_use_data$Date, to_use_data$Sub_metering_3, type = "l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lty = 0)

plot(to_use_data$Date, to_use_data$Voltage, xlab="datetime", ylab="Voltage",type="l")

plot(to_use_data$Date, to_use_data$Global_reactive_power, xlab="datetime", ylab="Global_reative_power", type="l")
dev.off()