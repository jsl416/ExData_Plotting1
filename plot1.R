###################################################################################
## Courseproject 1
## for plot 1
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
## Draw the histogram for plot1
png(file="plot1.png")
hist(to_use_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()