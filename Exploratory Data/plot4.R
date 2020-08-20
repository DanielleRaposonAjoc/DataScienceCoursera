library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_ids <-SCC[grepl("Coal", SCC$Short.Name), ]$SCC
coal_emissions<-subset(NEI,SCC %in% coal_ids)
totalByYear<-aggregate(coal_emissions$Emissions,list(coal_emissions$year),sum)
names(totalByYear)<-c("year","emission")
jpeg("plot4.png", width = 500, height = 500)
p<-ggplot(totalByYear, aes(x=year,y=emission))+geom_smooth()
p<-p+xlab("year")
p<-p+ylab("emissions from coal combustion-related sources")
p<-p+ggtitle("coal combustion emissions from 1999-2008 in the US")
print(p)
dev.off()