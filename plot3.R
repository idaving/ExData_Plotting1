# Create plot 3
#

# read in file to data frame
epc <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

# subset out the dates
epc_sub <- subset(epc,Date=="1/2/2007" | Date == "2/2/2007")

# str(epc_sub)
# $ Date                 : Factor w/ 1442 levels "1/1/2007","1/1/2008",..: 16 16 16 16 16 16 16 16 16 16 ...
# $ Time                 : Factor w/ 1440 levels "00:00:00","00:01:00",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ Global_active_power  : Factor w/ 4187 levels "?","0.076","0.078",..: 127 127 126 126 125 124 124 124 124 82 ...

t1<-as.character(epc_sub$Time)
d1<-as.character(epc_sub$Date)
# e.g., "1/2/2007" "1/2/2007"

dd1<-as.Date(d1,"%d/%m/%Y")
# e.g., "2007-02-01" "2007-02-01"

time1 <-paste(dd1,t1)
# e.g. "2007-02-01 00:00:00" "2007-02-01 00:01:00"

time2 <- strptime(time1, "%Y-%m-%d %H:%M:%S")
# [1] "2007-02-01 00:00:00 PST" "2007-02-01 00:01:00 PST"

# subset and convert Sub_metering data for plotting
sm1<-as.numeric(as.character(epc_sub$Sub_metering_1))
sm2<-as.numeric(as.character(epc_sub$Sub_metering_2))
sm3<-as.numeric(as.character(epc_sub$Sub_metering_3))


# plot to screen device
par(mfrow=c(1,1)) # set to 1 plot
par(mar=c(4,4,3,2)) # size to match example

plot( time2,sm1,xlab="",ylab="Energy sub metering",type="n",
           cex.lab=0.7,cex.axis=0.7 )
points(time2,sm1,type="l",col="black",cex.lab=0.7,cex.axis=0.7)
points(time2,sm2,type="l",col="red",cex.lab=0.7,cex.axis=0.7)
points(time2,sm3,type="l",col="blue",cex.lab=0.7,cex.axis=0.7)
legend("topright",cex=0.7,lwd=1,seg.len=2,col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# create plot file
# do it the following way instead of using dev.copy otherwise the legend is
#   truncated
png("plot3.png", width=480, height=480)
plot( time2,sm1,xlab="",ylab="Energy sub metering",type="n",
      cex.lab=0.7,cex.axis=0.7 )
points(time2,sm1,type="l",col="black",cex.lab=0.7,cex.axis=0.7)
points(time2,sm2,type="l",col="red",cex.lab=0.7,cex.axis=0.7)
points(time2,sm3,type="l",col="blue",cex.lab=0.7,cex.axis=0.7)
legend("topright",cex=0.7,lwd=1,seg.len=2,col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()



