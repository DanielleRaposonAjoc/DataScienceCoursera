NEI <- readRDS("summarySCC_PM25.rds")
baltCity<-subset(NEI, fips=="24510")

totalByYear<-aggregate(baltCity$Emissions,list(baltCity$year),sum)
names(totalByYear)<-c("year","totalEmission")
jpeg("plot2.png", width = 350, height = 350)
with(totalByYear,plot(year,totalEmission,type="l",xlab="year",ylab="Total PM 2.5 Emission"))
dev.off()