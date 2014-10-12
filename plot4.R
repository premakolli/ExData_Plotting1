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
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,0,0))
with(data_subset, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})
# Saving the plot to plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()