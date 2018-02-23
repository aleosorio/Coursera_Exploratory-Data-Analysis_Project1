# CALLING LIBRARIES TO USE
library(dpylr)
library(lubridate)

# SETTING WORKING DIRECTORY
setwd("C:/Users/lenovo/Documents/MAO/Aprendizaje/Data Science/Exploratory Data Analysis_Coursera/Assignment1")

# READING RAW DATA FROM WORKING DIRECTORY IN PC
        ## Decimal character set to "."
        ## na.strings set to "?"
        ## Colclasses set to "character", "character", "numeric" ... "numeric"
        household_power_consumption <- read.csv2("~/MAO/Aprendizaje/Data Science/Exploratory Data Analysis_Coursera/Assignment1/household_power_consumption.txt", dec = ".", na.strings ="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# GENERATING DATASET TO WORK WITH
        ## Subsetting
        dataset <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

        ## Formatting variable "Date" to date format
        dataset$Date <- dmy(dataset$Date)

        ## Adding "DateTime" Variable and formatting it to ymd_hms
        dataset <- mutate(dataset, DateTime = paste(Date, Time, sep = " "))
        dataset$DateTime <- ymd_hms(dataset$DateTime)

# SETTING UP MARGIN PARAMETERS
par(mar = c(4,8,1,8))

# OPENING PNG DEVICE TO CREATE "PLOT3.PNG" IN WORKING DIR
png(filename = "plot3.png")

# GENERATING PLOT
        ## X axis set to "n" (empty X axis)
        ## Sets x and y label texts
        ## Sets label text to 0.8 size
        ## Sets type to "n" (empty plot)
        with(dataset, plot(DateTime, Sub_metering_1, xaxt = "n", xlab = "", ylab = "Energy sub metering", cex.axis = 0.8, type = "n"))

        # Drawing X axis with correct labels' text and size
        with(dataset, axis(1, at = c(DateTime[1], DateTime[1440], DateTime[2880]), labels = c("Thu", "Fri", "Sat"), cex.axis = 0.8))

        # Plotting lines on empty plot
        with(dataset, lines(DateTime, Sub_metering_1))
        with(dataset, lines(DateTime, Sub_metering_2, col = "red"))
        with(dataset, lines(DateTime, Sub_metering_3, col = "blue"))
        
        # Drawing legend
        legend("topright", lty = c(1, 1, 1), cex = 0.8, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# CLOSING PNG DEVICE
dev.off()
