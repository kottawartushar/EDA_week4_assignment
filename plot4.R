library(ggplot2)

scc_pm25 <- readRDS("summarySCC_PM25.rds")
sourceCC <- readRDS("Source_Classification_Code.rds")

head(scc_pm25)
str(scc_pm25)

head(sourceCC)
str(sourceCC)

coal_data <- sourceCC[grepl("Coal", sourceCC$Short.Name, ignore.case = TRUE), ]
coal_data
scc_pm25_coal <- subset(scc_pm25, scc_pm25$SCC %in% coal_data$SCC)
scc_pm25_coal

coal_yearSum <- aggregate(scc_pm25_coal$Emissions, 
                          by = list(scc_pm25_coal$year), FUN = sum)

names(coal_yearSum)[1] <- "year"
names(coal_yearSum)[2] <- "coal_emissions"
coal_yearSum

qplot(year, coal_emissions, data = coal_yearSum)

dev.copy(png, file = "plot4.png", width = 480, height = 480)

dev.off()