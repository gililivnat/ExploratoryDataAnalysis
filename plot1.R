file <- "./data/household_power_consumption.txt"
rData <- read.table(file,sep=';',header=TRUE, stringsAsFactors = FALSE, dec=".")
subrData <- rData[rData$Date %in% c("1/2/2007","2/2/2007"),]
nrow(rData) #2,075,259,9 col, 8 bytes = 2M*9*8/2^20 =  137Mb
nrow(subrData) #2,880 ==> 0.2Mb
head(subrData)

str(subrData) #Global_active_power is char

png("plot1.png",width=480,height=480)
GAPDataNumeric <- as.numeric(subrData$Global_active_power)
hist(GAPDataNumeric,col="red",main="Global Active Power (kilowats)")
dev.off()