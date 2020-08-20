library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
baltCity<-subset(NEI, fips=="24510")

totalByYear<-aggregate(baltCity$Emissions,list(baltCity$type,baltCity$year),sum)
names(totalByYear)<-c("type","year","totalEmission")

jpeg("plot3.png", width = 350, height = 350)
p<-ggplot(totalByYear, aes(x=year,y=totalEmission,col=type))+geom_smooth()
print(p)
#p<-ggplot(totalByYear,aes(x=year,y=Emissions))
#p<-p+geom_smooth()
dev.off()