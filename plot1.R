NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data_1999<-subset(NEI,NEI$year==1999)
data_2002<-subset(NEI,NEI$year==2002)
data_2005<-subset(NEI,NEI$year==2005)
data_2008<-subset(NEI,NEI$year==2008)
data1<-data.frame(Emissions=c(sum(data_1999$Emissions),
                              sum(data_2002$Emissions),
                              sum(data_2005$Emissions),
                              sum(data_2008$Emissions)),
                  Year=c(1999,2002,2005,2008))
png("plot1.png")
with(data1,plot(Year,Emissions,type="l",
                main="Total Emissions from PM2.5 in the United States"))
dev.off()