# Download, unzip, load and prepare data
source("Proj 1.R")

plot(x= data$DateTime, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

if (!file.exists("plot"))
    dir.create("plot")

dev.copy(png, file="plot/plot2.png")
dev.off()
