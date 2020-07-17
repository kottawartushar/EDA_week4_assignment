scc_pm25 <- readRDS("summarySCC_PM25.rds")
sourceCC <- readRDS("Source_Classification_Code.rds")

head(scc_pm25)
str(scc_pm25)

head(sourceCC)
str(sourceCC)

baltimore <- subset(scc_pm25, scc_pm25$fips == "24510" & scc_pm25$type == "ON-ROAD")
baltimore

la <- subset(scc_pm25, scc_pm25$fips == "06037" & scc_pm25$type == "ON-ROAD")
la

baltimore_la <- rbind(baltimore, la)
baltimore_la

baltimore_la_yearSum <- aggregate(baltimore_la$Emissions, 
                                  by = list(baltimore_la$year, baltimore_la$fips), FUN = sum)
baltimore_la_yearSum

names(baltimore_la_yearSum)[1] <- "year"
names(baltimore_la_yearSum)[2] <- "city"
names(baltimore_la_yearSum)[3] <- "motor_emissions"
baltimore_la_yearSum

qplot(year, motor_emissions, data = baltimore_la_yearSum, color = city)

dev.copy(png, file = "plot6.png", width = 480, height = 480)

dev.off()