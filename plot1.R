## SETTING WORKING DIRECTORY
setwd("C:/Users/lenovo/Documents/MAO/Aprendizaje/Data Science/Exploratory Data Analysis_Coursera/Assignment1")


## READING RAW DATA FROM WORKING DIRECTORY IN PC
        ## Decimal character set to "."
        ## na.strings set to "?"
        ## Colclasses set to "character", "character", "numeric" ... "numeric"
household_power_consumption <- read.csv2("~/MAO/Aprendizaje/Data Science/Exploratory Data Analysis_Coursera/Assignment1/household_power_consumption.txt", dec = ".", na.strings ="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## SUBSETTING DATASET TO WORK WITH
dataset <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

## INITIALIZING HISTOGRAM WITH XLABEL AND MAIN TITLE
hist(dataset$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
        
## ANNOTATING

        ## Adding missing tick values to X axis
        axis(side = 2, at = c(400, 800, 1200))
        
        