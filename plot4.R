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
par(mfrow=c(2,2))
with(hpc_sub, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global_Reactive_Power", xlab="datetime")
})
dev.copy(png, "plot4.png")
dev.off()