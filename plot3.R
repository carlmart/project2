library(ggplot2)
##
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
##
fips <- NEI$fips

##
baltimore <- NEI[(fips == "24510"),]
##
by <- baltimore$year

by <- factor(by, levels=c(1999, 2002, 2005, 2008))
##
##
#png("example3.png", width = 480, height = 480)
p <- qplot(year, Emissions, data=baltimore)
p <- p + ggtitle("Pollution from sources in Baltimore City, Maryland")
p <- p + facet_grid( . ~ type)
p <- p + xlab('Year')
p <- p + ylab(expression(PM[2.5] * "Emissions (tons)"))
p <- p + theme_bw()
p <- p + geom_line()

#p <- p + theme(axis.title.x = element_text(size = rel(0.5), angle = 00))
#p <- p + theme(axis.title.y = element_text(size = rel(0.5), angle = 00))
ggsave(filename="plot3.png",plot=p)
#ggsave(filename="plot3.png",plot=p,scale=0.5)
#ggsave(filename="plot3.png",plot=p,width=5,height=5)    3 crunched axis

