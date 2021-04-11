data_rainfall <- read.csv("D:\\E-Angel\\Documents\\RStudio\\STSCI5999\\STSCI5999_SP2021\\Precipitation Quantity - Rainfall - Canada_monthly.csv")
df_rainfall <- data_rainfall
df_rainfall_Canada <- df_rainfall[df_rainfall$Region == "Canada",]
#####
# NOTICE: THIS DATA SHOULD START FROM JANUARY 2003.
# MODIFY IT WHEN THE TIME IS AVAILABLE
#####
ts_rainfall_Canada = ts(data = df_rainfall_Canada$Value, frequency = 12, start = c(2000, 6))
ts_rainfall_Canada

plot.ts(ts_rainfall_Canada)
rainfall_Canada_forcast <- HoltWinters(ts_rainfall_Canada)
rainfall_Canada_forcast
plot(rainfall_Canada_forcast)
rainfall_Canada_forcast$SSE

library(forecast)
rainfall_Canada_nextyr <- forecast(rainfall_Canada_forcast, h = 12)
rainfall_Canada_nextyr 

plot(forecast(rainfall_Canada_nextyr))


rainfall_Canada_nextyr_csv <- data.frame(rainfall_Canada_nextyr$mean,
                                         rainfall_Canada_nextyr$lower[,1],
                                         rainfall_Canada_nextyr$upper[,1],
                                         rainfall_Canada_nextyr$lower[,2],
                                         rainfall_Canada_nextyr$upper[,2])

# Rename for 80% and 95% averages
names(rainfall_Canada_nextyr_csv)[1] <- "mean"
names(rainfall_Canada_nextyr_csv)[2] <- "80% lower"
names(rainfall_Canada_nextyr_csv)[3] <- "80% upper"
names(rainfall_Canada_nextyr_csv)[4] <- "95% lower"
names(rainfall_Canada_nextyr_csv)[5] <- "95% upper"

write.csv(rainfall_Canada_nextyr_csv, "D:\\E-Angel\\Documents\\RStudio\\STSCI5999\\STSCI5999_SP2021\\Precipitation Quantity - Rainfall - Canada_prediction.csv", row.names = FALSE)