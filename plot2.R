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

# Draw plot2 -- good
plot(as.numeric(my_data_on_date$Global_active_power),type="l",ylab="Global Active Power (kilowatts)",xlab="",axes=FALSE)
axis(side=1, at=c(1,1400,2800), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=c(0,2,4,6), labels=c("0","2","4","6"))
box()

# Write plot2 to file plot2.png
dev.copy(png, filename = "plot2.png", width = 480, height = 480)
graphics.off()
