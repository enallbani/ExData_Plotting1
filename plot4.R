#Set working Directory
wd <- "C:/Users/Administrator/Desktop/Data_Science/Exploratory_Data_Analysis"
setwd(wd)

#Read the Power consumption file
DataPower  <- read.table("./files/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
subDataPower <- subset(DataPower, Date %in% c("1/2/2007","2/2/2007"))


SubDateTime <- strptime(paste(subDataPower$Date, subDataPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Create plot
png("plot4.png", width=480, height=480)

#Put plots in a 2x2 matrix
par(mfrow = c(2, 2)) 

#First plot
plot(SubDateTime, subDataPower$Global_active_power, type="l", ylab = "Global Active Power", xlab="")

#Second Plot
plot(SubDateTime, subDataPower$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Third plot
plot(SubDateTime, subDataPower$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(SubDateTime, subDataPower$Sub_metering_2, type="l", col="red")
lines(SubDateTime, subDataPower$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Fourth plot
plot(SubDateTime, subDataPower$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()




