##Reading Data 
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataset <- subset(dataset,dataset$Date %in% c("1/2/2007","2/2/2007"))
dataset$Date <- as.Date(dataset$Date,format="%d/%m/%Y")
datetime <- paste(as.Date(dataset$Date), dataset$Time)
dataset$Datetime <- as.POSIXct(datetime)

## Ploting Data 
with(dataset, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Exporting PNG 
png("plot3.png", width=480, height=480)
dev.off()
