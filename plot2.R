NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
##
##
fips <- NEI$fips
yR <-  NEI$year
x0 <- NEI$Emissions /10^6

NEIB <- NEI[(fips == "24510"),]
emissions <- aggregate(x0 ~ yR, NEIB, sum)
names(emissions) <- c("Year", "Emissions")
##
##
png(filename="plot2.png", width=480, height=480)
plot(emissions, xlab="Year", ylab=expression(PM[2.5] * " Emissions (10^6)"), type="b", pch=19, lty=1, col="blue")
title(main=expression(PM[2.5] * " Baltimore City,Maryland Emissions"))
dev.off();
##
##
