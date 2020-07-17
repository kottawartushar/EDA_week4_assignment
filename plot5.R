scc_pm25 <- readRDS("summarySCC_PM25.rds")
sourceCC <- readRDS("Source_Classification_Code.rds")

head(scc_pm25)
str(scc_pm25)

head(sourceCC)
str(sourceCC)

motor_baltimore <- subset(scc_pm25, scc_pm25$fips == "24510" & scc_pm25$type == "ON-ROAD")
motor_baltimore

motor_baltimore_yearSum <- aggregate(motor_baltimore$Emissions, 
                                     by = list(motor_baltimore$year), FUN = sum)
motor_baltimore_yearSum

names(motor_baltimore_yearSum)[1] <- "year"
names(motor_baltimore_yearSum)[2] <- "motor_emissions"
motor_baltimore_yearSum

qplot(year, motor_emissions, data = motor_baltimore_yearSum)

dev.copy(png, file = "plot5.png", width = 480, height = 480)

dev.off()