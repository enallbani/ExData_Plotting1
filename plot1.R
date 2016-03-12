#Set working Directory
wd <- "C:/Users/Administrator/Desktop/Data_Science/Exploratory_Data_Analysis"
setwd(wd)

#Read the Power consumption file
DataPower  <- read.table("./files/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
subDataPower <- subset(DataPower, Date %in% c("1/2/2007","2/2/2007"))

#Create histogram plot, set hist field, title, color, x label
png("plot1.png", width=480, height=480)
hist(subDataPower$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()