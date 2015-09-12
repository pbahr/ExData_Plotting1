# This is needed in RStudio since I have the project folder as the parent for this folder
# setwd("./ExData_Plotting1/")

# Download and unzip data file
if (!file.exists("data"))
    dir.create("data")

data.path <- file.path("data", "consumption.zip")
if (!file.exists(data.path)) {
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, data.path)
    unzip(data.path)
}

# figure out number of rows to skip
originDate <- as.POSIXct("2007-02-01 00:00")
firstDate <- as.POSIXct("2006-12-16 17:24")
diff <- difftime(originDate, firstDate, units = "mins")

# Target date range for data: 2/1/2007 and 2/2/2007

# figure out number of rows to read
toDate <- as.POSIXct("2007-02-03 00:00")
diff2 <- difftime(toDate, originDate, units = "mins")

#read the names row, didn't seem to work with nrows= 0
data.path.unzipped <- file.path("data", "household_power_consumption.txt")
names <- read.table(data.path.unzipped, header = T, sep = ";", nrows = 1)

# read data
data <- read.table(data.path.unzipped, header = T, sep = ';', na.strings = '?', nrows = diff2, 
                   colClasses = c("character", "character", rep("numeric", times = 7)), skip = as.numeric(diff))
# fix the names for the data
names(data) <- names(names)
rm(names)

# fix the date variable
data$DateTime <- paste(data$Date, data$Time, sep= " ")
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

# drop Date and Time columns, set DateTime as first column
data <- data[c(10, 3:9)]


