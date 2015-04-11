data<-read.table("household_power_consumption.txt",sep=";", header=TRUE)
filtered <- data[as.Date(data$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]
date<-as.Date(filtered$Date,format='%d/%m/%Y')
library(lubridate)
data1<-within(filtered,dateandtime<-ymd_hms(paste(date,filtered$Time,sep=" ")))
global<-as.numeric(as.character(data1$Global_active_power))
voltage<-as.numeric(as.character(data1$Voltage))
sub1<-as.numeric(as.character(data1$Sub_metering_1))
sub2<-as.numeric(as.character(data1$Sub_metering_2))
sub3<-as.numeric(as.character(data1$Sub_metering_3))
reactive<-as.numeric(as.character(data1$Global_reactive_power))

png(filename="plot4.png",width=480, height=480)
par(mfrow=c(2,2))
mar = c(4, 4, 2, 1)
oma = c(0, 0, 2, 0)
with(data1,{
    plot(dateandtime,global,type="l",xlab="",ylab="Global Active Power")
    plot(dateandtime,voltage,type="l",xlab="datetime",ylab="Voltage")
    with(data1,plot(dateandtime,sub1,type="l",xlab="",ylab="Energy sub metering"))
    with(data1,lines(data1$dateandtime,sub2,type="l",col="red"))
    with(data1,lines(data1$dateandtime,sub3,type="l",col="blue"))
    legend("topright",lty=1,cex=0.7,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(dateandtime,reactive,type="l",xlab="datetime",ylab="Global_reactive_power")
}
        )
library(datasets)

dev.off()

