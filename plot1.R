# Loading the dataset into R
data <- read.csv("C:/Users/Prema/Documents/exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting data to dates 2007-02-01 and 2007-02-02
data_subset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting the Date and Time variables to Date/Time classes in R
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

# Constructing the Plot
hist(data_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving the plot to plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()