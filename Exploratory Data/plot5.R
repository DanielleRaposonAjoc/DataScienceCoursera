library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")

coal_emissions<-subset(NEI,type=="ON-ROAD" & fips=="24510")
totalByYear<-aggregate(coal_emissions$Emissions,list(coal_emissions$year),sum)
names(totalByYear)<-c("year","emission")
jpeg("plot5.png", width = 500, height = 500)
p<-plot(totalByYear$year, totalByYear$emission,
     type = "o",
     xlab = "year",
     ylab = "Total Emissions",
     main = "Total Emissions of PM2.5 related to motor Vehicles in baltimore")
print(p)
dev.off()