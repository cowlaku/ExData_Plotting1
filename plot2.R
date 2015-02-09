### Read Data

# Figure out the structure of the data set
readLines("household_power_consumption.txt", n = 2)
# Define the class of each variables
classes <- c("character", "character", rep("numeric", 7))
# Read Data
hpc <- read.table("household_power_consumption.txt", header = TRUE, 
                  sep = ";", na.strings = "?", colClasses = classes)
hpc2days <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
# Set date and time
hpc2days$Time <- strptime(paste(hpc2days$Date, hpc2days$Time), 
                          "%d/%m/%Y %H:%M:%S")


### Plotting

png("plot2.png", width = 480, height = 480)
with(hpc2days, plot(Time, Global_active_power, type = "l",
                    ylab = "Global Active Power (kilowatts)"))
dev.off()

