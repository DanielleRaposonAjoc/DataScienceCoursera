library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
cities<-subset(NEI, type=="ON-ROAD"&(fips=="24510"|fips=="06037"))

totalByYear<-aggregate(cities$Emissions,list(cities$fips,cities$year),sum)
names(totalByYear)<-c("city","year","totalEmission")

jpeg("plot6.png", width = 350, height = 350)
p<-ggplot(totalByYear, aes(x=year,y=totalEmission,col=city))+geom_smooth()
p<-p+xlab("year")
p<-p+ylab("emissions from motor vehicle sources")
p<-p+ggtitle("emissions from motor vehicle sources in Baltimore City and LA")
print(p)

dev.off()