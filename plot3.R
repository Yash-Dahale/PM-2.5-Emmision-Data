library(ggplot2)
library(RColorBrewer)

##Loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Sourcelassification_Code.rds")

## Subseting the data
Baltimore <- subset(NEI,NEI$fips == "24510")
Typebaltimore <- aggregate(Emissions~year+type,Baltimore,sum)
Typebaltimore

##plot the graph
par(mar = c(4,5,2,2))
ggplot(data = Typebaltimore,aes(year,Emissions,col = type))+
  geom_line()+
  geom_point()+
  ylab(expression("Total Baltimore " ~PM[2.5]~"Emissions"))+
  xlab("Year")+
  ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year"))+
  scale_colour_discrete(name = "Type of Sources")+
  theme(legend.title = element_text(face = "bold"))

##Save the plot as plot3.png
png("plot3.png",width = 480,height = 480)
par(mar = c(4,5,2,2))
ggplot(data = Typebaltimore,aes(year,Emissions,col = type))+
  geom_line()+
  geom_point()+
  ylab(expression("Total Baltimore " ~PM[2.5]~"Emissions"))+
  xlab("Year")+
  ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year"))+
  scale_colour_discrete(name = "Type of Sources")+
  theme(legend.title = element_text(face = "bold"))
dev.off()
