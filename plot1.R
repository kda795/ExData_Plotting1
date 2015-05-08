### Script was created and tested on Windows XP SP3 and R v. 3.2.0 (i386)

# Setup working directory 
# You should to change working directory or comment next line
# If you work on Linus you should change path name

setwd("D:\\Course\\Exploratory Data Analysis\\CourseProject1")

# Test if data directory  exists
if ( !file.exists(".\\data") ) {
   dir.create(".\\data")
  }


# Setup data file name for download
dest_file<-".\\household_power_consumption.zip"

# Setup URL for file download 
fileUrl<-"http://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"

# Download file form Internet
download.file(fileUrl,dest_file)

# Get path to data file
path<-paste0(".\\data\\",list.files(".\\data"))

# Unzip data file
unzip(dest_file,exdir=".\\data")

# Get path to data file
path<-paste0(".\\data\\",list.files(".\\data"))

# Read   data from file to table my_data
my_data<-read.csv(path, sep=";",header=TRUE, colClasses = "character")

# Select on date 
my_data_on_date<-subset(my_data, (my_data$Date == "1/2/2007") | (my_data$Date == "2/2/2007"))


# Draw plot1 -- good
hist(as.numeric(my_data_on_date$Global_active_power),col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
#axis(side=1, at=c(1,1400,2800), labels=c("Thu", "Fri", "Sat"))
#axis(side=2, at=c(0,2,4,6), labels=c("0","2","4","6"))

# Write plot1 to file plot1.png
dev.copy(png, filename = "plot1.png", width = 480, height = 480)
graphics.off()