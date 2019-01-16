###Exploratory Data Analysis
###Week 1
###Course project

setwd("C:/Users/JONAH/Documents/Exploratory Data Analysis/Week 1/course project")
#check memory
install.packages("pryr")
library(pryr)
object.size(read.table("household_power_consumption.txt"))

#read data
hpc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

#subset
hpc_sub<-subset(hpc,Date %in% c("1/2/2007","2/2/2007"))

#convert date and time
hpc_sub$Date <- as.Date(hpc_sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc_sub$Date), hpc_sub$Time)
hpc_sub$DateTime <- as.POSIXct(datetime)


#plot
hist(hpc_sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.copy(png, "plot1.png")
dev.off()