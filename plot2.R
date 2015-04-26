NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore<-subset(NEI,NEI$fips=="24510")
baltimore_1999<-subset(baltimore,baltimore$year==1999)
baltimore_2002<-subset(baltimore,baltimore$year==2002)
baltimore_2005<-subset(baltimore,baltimore$year==2005)
baltimore_2008<-subset(baltimore,baltimore$year==2008)
data2<-data.frame(Emissions=c(sum(baltimore_1999$Emissions),
                              sum(baltimore_2002$Emissions),
                              sum(baltimore_2005$Emissions),
                              sum(baltimore_2008$Emissions)),
                  Year=c(1999,2002,2005,2008))
png("plot2.png")
with(data2,plot(Year,Emissions,type="l",
                main="Total Emissions from PM2.5 in Baltimore"))
dev.off()