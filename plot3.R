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
par(mfrow=c(1,1))
with(hpc_sub, {
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.copy(png, "plot3.png")
dev.off()