NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore<-subset(NEI,NEI$fips=="24510")

point_1999<-subset(baltimore,baltimore$type=="POINT" 
                        & baltimore$year==1999)
point_2002<-subset(baltimore,baltimore$type=="POINT" 
                   & baltimore$year==2002)
point_2005<-subset(baltimore,baltimore$type=="POINT" 
                   & baltimore$year==2005)
point_2008<-subset(baltimore,baltimore$type=="POINT" 
                   & baltimore$year==2008)

nonpoint_1999<-subset(baltimore,baltimore$type=="NONPOINT" 
                   & baltimore$year==1999)
nonpoint_2002<-subset(baltimore,baltimore$type=="NONPOINT" 
                   & baltimore$year==2002)
nonpoint_2005<-subset(baltimore,baltimore$type=="NONPOINT" 
                   & baltimore$year==2005)
nonpoint_2008<-subset(baltimore,baltimore$type=="NONPOINT" 
                   & baltimore$year==2008)

onroad_1999<-subset(baltimore,baltimore$type=="ON-ROAD" 
                      & baltimore$year==1999)
onroad_2002<-subset(baltimore,baltimore$type=="ON-ROAD" 
                      & baltimore$year==2002)
onroad_2005<-subset(baltimore,baltimore$type=="ON-ROAD" 
                      & baltimore$year==2005)
onroad_2008<-subset(baltimore,baltimore$type=="ON-ROAD" 
                      & baltimore$year==2008)

nonroad_1999<-subset(baltimore,baltimore$type=="NON-ROAD" 
                    & baltimore$year==1999)
nonroad_2002<-subset(baltimore,baltimore$type=="NON-ROAD" 
                    & baltimore$year==2002)
nonroad_2005<-subset(baltimore,baltimore$type=="NON-ROAD" 
                    & baltimore$year==2005)
nonroad_2008<-subset(baltimore,baltimore$type=="NON-ROAD" 
                    & baltimore$year==2008)

data3<-data.frame(year=c(1999,2002,2005,2008),
                  point=c(sum(point_1999$Emissions),
                          sum(point_2002$Emissions),
                          sum(point_2005$Emissions),
                          sum(point_2008$Emissions)),
                  nonpoint=c(sum(nonpoint_1999$Emissions),
                             sum(nonpoint_2002$Emissions),
                             sum(nonpoint_2005$Emissions),
                             sum(nonpoint_2008$Emissions)),
                  onroad=c(sum(onroad_1999$Emissions),
                             sum(onroad_2002$Emissions),
                             sum(onroad_2005$Emissions),
                             sum(onroad_2008$Emissions)),
                  nonroad=c(sum(nonroad_1999$Emissions),
                            sum(nonroad_2002$Emissions),
                            sum(nonroad_2005$Emissions),
                            sum(nonroad_2008$Emissions)))

library(ggplot2)
library(reshape2)
png("plot3.png")
data3_long<-melt(data3,id="year",value.name="emissions",variable.name="type")
ggplot(data=data3_long,aes(x=year,y=emissions,group=type,color=type)) +
    geom_line() 
dev.off()