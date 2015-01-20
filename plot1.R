NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
##
##
x0 <- NEI$Emissions / 10^6
yR <- NEI$year
emissions <- aggregate(x0 ~ yR, NEI, sum)
names(emissions) <- c("Year", "Emissions")
##

png(filename="plot1.png", width=480, height=480)
plot(emissions, xlab="Year", ylab="Emissions (millions of tons)", type="b", pch=19, lty=1, col="red")
title(main=expression(PM[2.5] * " Total Emissions"))
dev.off();
