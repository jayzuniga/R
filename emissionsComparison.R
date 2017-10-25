#Compare emissions from motor vehicle sources in Baltimore City with 
#emissions from motor vehicle sources in Los Angeles County, California 
#(fips == "06037"). Which city has seen greater changes over time in motor vehicle 
#emissions?
#
# Load ggplot2
library(ggplot2)
# Load data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
# Make list of cities to filter by
city_list <- c("24510", "06037")
# Make list of sources
motor_list <- c("Mobile - On-Road Gasoline Light Duty Vehicles",
                "Mobile - On-Road Gasoline Heavy Duty Vehicles",   
                "Mobile - On-Road Diesel Light Duty Vehicles",       
                "Mobile - On-Road Diesel Heavy Duty Vehicles")  
# Filter SCC codes by motor vehicle sources
SCCx <- SCC[is.element(SCC$EI.Sector, motor_list),c("SCC")]
# Subset NEI by motor vehicle sources
NEIx <- NEI[is.element(NEI$SCC, SCCx), c("Emissions", "fips", "year")]
# Subset NEI by cities: Baltimore and LA
NEIx <- NEIx[is.element(NEIx$fips, city_list), c("Emissions", "fips", "year")]
# Sum emissions by year and city
agg <- aggregate(NEIx$Emissions~NEIx$fips+NEIx$year, data=NEIx, sum)
# Simplify column names
colnames(agg) <- c("fips","year","emissions")
# Create image file and plot
png("plot6_ex2.png", width=600, height=480)
compare_plot <- qplot(x=agg$year, y=agg$emissions, data=agg, color=fips, geom="line",
      main="Emissions comparison: LA(06037) and Baltimore (24510)",
      xlab="years", ylab="emissions")
print(compare_ploSt)
dev.off()


