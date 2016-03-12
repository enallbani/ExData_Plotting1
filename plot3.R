#Set working Directory
wd <- "C:/Users/Administrator/Desktop/Data_Science/Exploratory_Data_Analysis"
setwd(wd)

#Read the Power consumption file
DataPower  <- read.table("./files/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
subDataPower <- subset(DataPower, Date %in% c("1/2/2007","2/2/2007"))

SubDateTime <- strptime(paste(subDataPower$Date, subDataPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Create plot
png("plot3.png", width=480, height=480)
plot(SubDateTime, subDataPower$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(SubDateTime, subDataPower$Sub_metering_2, type="l", col="red")
lines(SubDateTime, subDataPower$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()

