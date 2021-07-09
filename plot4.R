##Across the United States, how have emissions from coal 
##combustion-related sources changed from 1999–2008?
library(ggplot2)
library(RColorBrewer)

##Goal: PM 2.5 Coal Emission vs Year graph based on Type

##Load the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Sourcelassification_Code.rds")

##Subset data for Coal Emission
SCCCoal <-SCC[grepl("coal",SCC$Short.Name,ignore.case = TRUE),]
NEICoal <- NEI[NEI$SCC %in% SCCCoal$SCC,]

##Calculate Coal Emission by Year and Type
TotalCoal <- aggregate(Emissions~year+type,NEICoal,sum)
TotalCoal

##Plot The coal Emission by Year and Type
par(mar = c(4,4,2,1))
ggplot(TotalCoal,aes(year,Emissions,col = type))+
  geom_point()+geom_line()+
  ylab(expression("US"~PM[2.5]~"Coal Emission"))+
  xlab("Year")+
  ggtitle(expression("Total US"~PM[2.5]~"Coal Emission by Type and year"))+
  scale_color_discrete(name = "Type of Sources")

##Save plot as plot4.png
png("plot4.png",width = 480,height = 480)
par(mar = c(4,4,2,1))
ggplot(TotalCoal,aes(year,Emissions,col = type))+
  geom_point()+geom_line()+
  ylab(expression("US"~PM[2.5]~"Coal Emission"))+
  xlab("Year")+
  ggtitle(expression("Total US"~PM[2.5]~"Coal Emission by Type and year"))+
  scale_color_discrete(name = "Type of Sources")
dev.off()
