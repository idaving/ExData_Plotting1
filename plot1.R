# Generate plot1
#

# read in file to data frame
epc <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

# subset out the dates
epc_sub <- subset(epc,Date=="1/2/2007" | Date == "2/2/2007")

# create histogram
par(mfrow=c(1,1)) # set to 1 plot
par(mar=c(4,4,3,2)) # size to match example

hist(as.numeric(as.character(epc_sub$Global_active_power)),main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red",cex.lab=0.7,cex.axis=0.7)

# create plot file
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()