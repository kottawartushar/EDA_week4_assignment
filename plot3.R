library(ggplot2)

scc_pm25 <- readRDS("summarySCC_PM25.rds")
sourceCC <- readRDS("Source_Classification_Code.rds")

head(scc_pm25)
str(scc_pm25)

head(sourceCC)
str(sourceCC)

subs_baltimore <- subset(scc_pm25, scc_pm25$fips == "24510")
subs_baltimore

bal_yearSum <- aggregate(subs_baltimore$Emissions, 
                         by = list(subs_baltimore$year, subs_baltimore$type), FUN = sum)
bal_yearSum

names(bal_yearSum)[1] <- "year"
names(bal_yearSum)[2] <- "type"
names(bal_yearSum)[3] <- "total_emissions"
bal_yearSum

dev.copy(png, file = "plot3.png", width = 480, height = 480)

qplot(year, total_emissions, data = bal_yearSum, color = type)

dev.off()
