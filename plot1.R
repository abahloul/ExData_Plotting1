##Reading Data 
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataset <- subset(dataset,dataset$Date %in% c("1/2/2007","2/2/2007"))
dataset$Date <- as.Date(dataset$Date,format="%d/%m/%Y")

## Ploting Data 
hist(dataset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Exporting PNG 
png("plot1.png", width=480, height=480)
dev.off()
