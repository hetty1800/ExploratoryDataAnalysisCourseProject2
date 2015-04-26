NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
with(NEI,plot(year,Emissions,
              main="Total Emissions from PM2.5 in the United States",
              type="n"))
with(subset(NEI,type="POINT"),plot(year,Emissions,col="blue"))