NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset and merge data
baltimore<-subset(NEI,NEI$fips=="24510")
motor<-SCC[SCC$Data.Category=="Onroad",]
baltimore_motor=merge(baltimore,motor,by="SCC")

#subset data
baltimore_motor_1999<-subset(baltimore_motor,baltimore_motor$year==1999)
baltimore_motor_2002<-subset(baltimore_motor,baltimore_motor$year==2002)
baltimore_motor_2005<-subset(baltimore_motor,baltimore_motor$year==2005)
baltimore_motor_2008<-subset(baltimore_motor,baltimore_motor$year==2008)
#create data frame
data5<-data.frame(Emissions=c(sum(baltimore_motor_1999$Emissions),
                              sum(baltimore_motor_2002$Emissions),
                              sum(baltimore_motor_2005$Emissions),
                              sum(baltimore_motor_2008$Emissions)),
                  Year=c(1999,2002,2005,2008))

png("plot5.png")
with(data5,plot(Year,Emissions,type="l",
                main="Emissions from motor vehicle sources in Baltimore"))
dev.off()