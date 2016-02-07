file <- "./data/household_power_consumption.txt"
rData <- read.table(file,sep=';',header=TRUE, stringsAsFactors = FALSE, dec=".")
subrData <- rData[rData$Date %in% c("1/2/2007","2/2/2007"),]
nrow(rData) #2,075,259,9 col, 8 bytes = 2M*9*8/2^20 =  137Mb
nrow(subrData) #2,880 ==> 0.2Mb
head(subrData)

str(subrData) #Global_active_power is char

datetime <- strptime(paste(subrData$Date,subrData$Time,sep=" "),"%d/%M/%Y %H:%M:%S")
GAPDataNumeric <- as.numeric(subrData$Global_active_power)
subMetering1 <- as.numeric(subrData$Sub_metering_1)
subMetering2 <- as.numeric(subrData$Sub_metering_2)
subMetering3 <- as.numeric(subrData$Sub_metering_3)

png("plot3.png",width=480,height=480)
plot(datetime,subMetering1,type="l",xlab="",ylab="Energy Submetering")
lines(datetime,subMetering2,col="red",type="l")
lines(datetime,subMetering3,col="blue",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()

