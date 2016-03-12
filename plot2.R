#Set working Directory
wd <- "C:/Users/Administrator/Desktop/Data_Science/Exploratory_Data_Analysis"
setwd(wd)

#Read the Power consumption file
DataPower  <- read.table("./files/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
subDataPower <- subset(DataPower, Date %in% c("1/2/2007","2/2/2007"))

#Create plot
SubDateTime <- strptime(paste(subDataPower$Date, subDataPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(SubDateTime, subDataPower$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
