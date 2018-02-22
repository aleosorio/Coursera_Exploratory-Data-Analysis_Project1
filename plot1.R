# SETTING WORKING DIRECTORY
setwd("C:/Users/lenovo/Documents/MAO/Aprendizaje/Data Science/Exploratory Data Analysis_Coursera/Assignment1")


# READING RAW DATA FROM WORKING DIRECTORY IN PC
## Decimal character set to "."
## na.strings set to "?"
## Colclasses set to "character", "character", "numeric" ... "numeric"
household_power_consumption <- read.csv2("~/MAO/Aprendizaje/Data Science/Exploratory Data Analysis_Coursera/Assignment1/household_power_consumption.txt", dec = ".", na.strings ="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# SUBSETTING DATASET TO WORK WITH
dataset <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# SETTING UP MARGIN PARAMETERS
par(mar = c(4,8,1,8))

# OPEN PNG DEVICE TO CREATE "PLOT1.PNG" IN WORKING DIR
png(filename = "plot1.png")

# GENERATING HISTOGRAM
## Includes xlabel, main title and plotting color
## Sets label text to 0.8 size
hist(dataset$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red", cex.axis = 0.8)

# CLOSE PNG DEVICE
dev.off()
