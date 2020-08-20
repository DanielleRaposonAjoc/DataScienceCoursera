## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalByYear<-aggregate(NEI$Emissions,list(NEI$year),sum)
names(totalByYear)<-c("year","totalEmission")
jpeg("plot1.png", width = 350, height = 350)
with(totalByYear,plot(year,totalEmission,type="l",xlab="year",ylab="Total PM 2.5 Emission"))
dev.off()