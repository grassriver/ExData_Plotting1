data<-read.table("household_power_consumption.txt",sep=";", header=TRUE)
filtered <- data[as.Date(data$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]
date<-as.Date(filtered$Date,format='%d/%m/%Y')
library(lubridate)
data1<-within(filtered,dateandtime<-ymd_hms(paste(date,filtered$Time,sep=" ")))
sub1<-as.numeric(as.character(data1$Sub_metering_1))
sub2<-as.numeric(as.character(data1$Sub_metering_2))
sub3<-as.numeric(as.character(data1$Sub_metering_3))
png(filename="plot3.png",width=480, height=480)
with(data1,plot(dateandtime,sub1,type="l",xlab="",ylab="Energy sub metering"))
with(data1,lines(data1$dateandtime,sub2,type="l",col="red"))
with(data1,lines(data1$dateandtime,sub3,type="l",col="blue"))
legend("topright",lty=1,cex=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
library(datasets)
dev.off()

