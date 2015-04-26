NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset and merge data
baltimore<-subset(NEI,NEI$fips=="24510")
la<-subset(NEI,NEI$fips=="06037")
motor<-SCC[SCC$Data.Category=="Onroad",]
baltimore_motor=merge(baltimore,motor,by="SCC")
la_motor=merge(la,motor,by="SCC")

#subset data
baltimore_motor_1999<-subset(baltimore_motor,baltimore_motor$year==1999)
baltimore_motor_2002<-subset(baltimore_motor,baltimore_motor$year==2002)
baltimore_motor_2005<-subset(baltimore_motor,baltimore_motor$year==2005)
baltimore_motor_2008<-subset(baltimore_motor,baltimore_motor$year==2008)

la_motor_1999<-subset(la_motor,la_motor$year==1999)
la_motor_2002<-subset(la_motor,la_motor$year==2002)
la_motor_2005<-subset(la_motor,la_motor$year==2005)
la_motor_2008<-subset(la_motor,la_motor$year==2008)

#create data frame
> data6<-data.frame(year=c(1999,2002,2005,2008),
                   baltimore=c(sum(baltimore_motor_1999$Emissions),
                               sum(baltimore_motor_2002$Emissions),
                               sum(baltimore_motor_2005$Emissions),
                               sum(baltimore_motor_2008$Emissions)),
                   los_angeles=c(sum(la_motor_1999$Emissions),
                                 sum(la_motor_2002$Emissions),
                                 sum(la_motor_2005$Emissions),
                                 sum(la_motor_2008$Emissions)))
#reshape data
library(reshape2)
data6_long<-melt(data6,id="year",value.name="emissions",variable.name="city")

library(ggplot2)
png("plot6.png")
ggplot(data=data6_long,aes(x=year,y=emissions,group=city,color=city)) + 
    geom_line() + 
    ggtitle("Emissions from motor vehicle sources \n in Baltimore and Los Angeles") +
    labs(y="emissions")
dev.off()