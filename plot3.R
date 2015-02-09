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

png("plot3.png", width = 480, height = 480)
with(hpc2days, plot(Time, Sub_metering_1, type = "l",
                    ylab = "Energy sub metering"))
with(hpc2days, lines(Time, Sub_metering_2, type = "l", col = "red"))
with(hpc2days, lines(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = names(hpc2days)[7:9], lty=1, 
       col=c("black", "red", "blue"))
dev.off()

