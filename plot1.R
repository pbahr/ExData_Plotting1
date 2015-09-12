# Download, unzip, load and prepare data
source("Proj 1.R")

hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col= "red", main = "Global Active Power")

if (!file.exists("plot"))
    dir.create("plot")

dev.copy(png, file="plot/plot1.png")
dev.off()
