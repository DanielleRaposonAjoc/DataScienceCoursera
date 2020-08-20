data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data$Date<-as.Date(data$Date,"%d/%m/%Y")

data<-subset(data,Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
data<-data[complete.cases(data),]
data$Global_active_power<-as.numeric(data$Global_active_power)

jpeg("plot1.png", width = 480, height = 480)
p<-hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
)
print(p)
dev.off()