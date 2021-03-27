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