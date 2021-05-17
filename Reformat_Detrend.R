# cycle starts from March.
library(reshape)
data = read.csv('Variables.csv')
yield = read.csv('Detrend Yield.csv')

data_Region = split.data.frame(data, data$Region)
yield_Region = split.data.frame(yield, yield$Region)

# Alberta
Alberta_regression = reshape(data_Region$Alberta, direction = 'wide', 
                             idvar = 'Year', timevar = 'Month')

Alberta_regression = data.frame(Alberta_regression, Yield = rep(0, 22))

for (i in min(Alberta_regression$Year):min(max(Alberta_regression$Year),2020)){
  yield_year = yield_Region$Alberta[yield_Region$Alberta$year == i,]$Detrended.Value
  print(yield_year)
  Alberta_regression[Alberta_regression$Year == i,]$Yield = yield_year
}

Alberta_regression$X = NULL
Alberta_regression$X.1 = NULL
Alberta_regression$X.2 = NULL
Alberta_regression$X.3 = NULL
Alberta_regression$X.4 = NULL
Alberta_regression$X.5 = NULL
Alberta_regression$X.6 = NULL
Alberta_regression$X.7 = NULL
Alberta_regression$X.8 = NULL
Alberta_regression$X.9 = NULL
Alberta_regression$X.10 = NULL
Alberta_regression$X.11 = NULL
Alberta_regression$X.12 = NULL
Alberta_regression$Region.1 = NULL
Alberta_regression$Region.2 = NULL
Alberta_regression$Region.3 = NULL
Alberta_regression$Region.4 = NULL
Alberta_regression$Region.5 = NULL
Alberta_regression$Region.6 = NULL
Alberta_regression$Region.7 = NULL
Alberta_regression$Region.8 = NULL
Alberta_regression$Region.9 = NULL
Alberta_regression$Region.10 = NULL
Alberta_regression$Region.11 = NULL
Alberta_regression$Region.12 = NULL

Alberta_regression


write.csv(Alberta_regression, 'Alberta_Reg_Detrend.csv')

# British Columbia
British_Columbia_regression = reshape(data_Region$`British Columbia`, 
                                      direction = 'wide', 
                                      idvar = 'Year', timevar = 'Month')

British_Columbia_regression = data.frame(British_Columbia_regression, 
                                         Yield = rep(NA, 22))

for (i in min(British_Columbia_regression$Year):
     min(max(British_Columbia_regression$Year),2020)){
  yield_year = yield_Region$`British Columbia`[yield_Region$`British Columbia`$year 
                                               == i,]$Value
  British_Columbia_regression[British_Columbia_regression$Year 
                              == i,]$Yield = yield_year
}

British_Columbia_regression$X = NULL
British_Columbia_regression$X.1 = NULL
British_Columbia_regression$X.2 = NULL
British_Columbia_regression$X.3 = NULL
British_Columbia_regression$X.4 = NULL
British_Columbia_regression$X.5 = NULL
British_Columbia_regression$X.6 = NULL
British_Columbia_regression$X.7 = NULL
British_Columbia_regression$X.8 = NULL
British_Columbia_regression$X.9 = NULL
British_Columbia_regression$X.10 = NULL
British_Columbia_regression$X.11 = NULL
British_Columbia_regression$X.12 = NULL
British_Columbia_regression$Region.1 = NULL
British_Columbia_regression$Region.2 = NULL
British_Columbia_regression$Region.3= NULL
British_Columbia_regression$Region.4 = NULL
British_Columbia_regression$Region.5 = NULL
British_Columbia_regression$Region.6 = NULL
British_Columbia_regression$Region.7 = NULL
British_Columbia_regression$Region.8 = NULL
British_Columbia_regression$Region.9 = NULL
British_Columbia_regression$Region.10 = NULL
British_Columbia_regression$Region.11 = NULL
British_Columbia_regression$Region.12 = NULL

na.omit(British_Columbia_regression)

write.csv(British_Columbia_regression, 'British_Columbia_Reg_Detrend.csv')

# Manitoba
Manitoba_regression = reshape(data_Region$Manitoba, direction = 'wide', 
                              idvar = 'Year', timevar = 'Month')

Manitoba_regression = data.frame(Manitoba_regression, Yield = rep(0, 22))

for (i in min(Manitoba_regression$Year):min(max(Manitoba_regression$Year),2020)){
  yield_year = yield_Region$Manitoba[yield_Region$Manitoba$year == i,]$Value
  Manitoba_regression[Manitoba_regression$Year == i,]$Yield = yield_year
}

Manitoba_regression$X = NULL
Manitoba_regression$X.1 = NULL
Manitoba_regression$X.2 = NULL
Manitoba_regression$X.3 = NULL
Manitoba_regression$X.4 = NULL
Manitoba_regression$X.5 = NULL
Manitoba_regression$X.6 = NULL
Manitoba_regression$X.7 = NULL
Manitoba_regression$X.8 = NULL
Manitoba_regression$X.9 = NULL
Manitoba_regression$X.10 = NULL
Manitoba_regression$X.11 = NULL
Manitoba_regression$X.12 = NULL
Manitoba_regression$Region.1 = NULL
Manitoba_regression$Region.2 = NULL
Manitoba_regression$Region.3 = NULL
Manitoba_regression$Region.4 = NULL
Manitoba_regression$Region.5 = NULL
Manitoba_regression$Region.6 = NULL
Manitoba_regression$Region.7 = NULL
Manitoba_regression$Region.8 = NULL
Manitoba_regression$Region.9 = NULL
Manitoba_regression$Region.10 = NULL
Manitoba_regression$Region.11 = NULL
Manitoba_regression$Region.12 = NULL

na.omit(Manitoba_regression)

write.csv(Manitoba_regression, 'Manitoba_Reg_Detrend.csv')

# Canada
Canada_regression = reshape(data_Region$Canada, direction = 'wide', 
                            idvar = 'Year', timevar = 'Month')

Canada_regression = data.frame(Canada_regression, Yield = rep(0, 22))

for (i in min(Canada_regression$Year):min(max(Canada_regression$Year),2020)){
  yield_year = yield_Region$Canada[yield_Region$Canada$year == i,]$Value
  Canada_regression[Canada_regression$Year == i,]$Yield = yield_year
}

Canada_regression$X = NULL
Canada_regression$X.1 = NULL
Canada_regression$X.2 = NULL
Canada_regression$X.3 = NULL
Canada_regression$X.4 = NULL
Canada_regression$X.5 = NULL
Canada_regression$X.6 = NULL
Canada_regression$X.7 = NULL
Canada_regression$X.8 = NULL
Canada_regression$X.9 = NULL
Canada_regression$X.10 = NULL
Canada_regression$X.11 = NULL
Canada_regression$X.12 = NULL
Canada_regression$Region.1 = NULL
Canada_regression$Region.2 = NULL
Canada_regression$Region.3 = NULL
Canada_regression$Region.4 = NULL
Canada_regression$Region.5 = NULL
Canada_regression$Region.6 = NULL
Canada_regression$Region.7 = NULL
Canada_regression$Region.8 = NULL
Canada_regression$Region.9 = NULL
Canada_regression$Region.10 = NULL
Canada_regression$Region.11 = NULL
Canada_regression$Region.12 = NULL

na.omit(Canada_regression)

write.csv(Canada_regression, 'Canada_Reg_Detrend.csv')

# Ontario
Ontario_regression = reshape(data_Region$Ontario, direction = 'wide', 
                             idvar = 'Year', timevar = 'Month')

Ontario_regression = data.frame(Ontario_regression, Yield = rep(0, 22))

for (i in min(Ontario_regression$Year):min(max(Ontario_regression$Year),2020)){
  yield_year = yield_Region$Ontario[yield_Region$Ontario$year == i,]$Value
  Ontario_regression[Ontario_regression$Year == i,]$Yield = yield_year
}

Ontario_regression$X = NULL
Ontario_regression$X.1 = NULL
Ontario_regression$X.2 = NULL
Ontario_regression$X.3 = NULL
Ontario_regression$X.4 = NULL
Ontario_regression$X.5 = NULL
Ontario_regression$X.6 = NULL
Ontario_regression$X.7 = NULL
Ontario_regression$X.8 = NULL
Ontario_regression$X.9 = NULL
Ontario_regression$X.10 = NULL
Ontario_regression$X.11 = NULL
Ontario_regression$X.12 = NULL
Ontario_regression$Region.1 = NULL
Ontario_regression$Region.2 = NULL
Ontario_regression$Region.3 = NULL
Ontario_regression$Region.4 = NULL
Ontario_regression$Region.5 = NULL
Ontario_regression$Region.6 = NULL
Ontario_regression$Region.7 = NULL
Ontario_regression$Region.8 = NULL
Ontario_regression$Region.9 = NULL
Ontario_regression$Region.10 = NULL
Ontario_regression$Region.11 = NULL
Ontario_regression$Region.12 = NULL

na.omit(Ontario_regression)

write.csv(Ontario_regression, 'Ontario_Reg_Detrend.csv')

# Quacbec
Quacbec_regression = reshape(data_Region$`Québec`, direction = 'wide', 
                             idvar = 'Year', timevar = 'Month')

Quacbec_regression = data.frame(Quacbec_regression, Yield = rep(0, 22))

for (i in min(Quacbec_regression$Year):min(max(Quacbec_regression$Year),2020)){
  yield_year = yield_Region$`Québec`[yield_Region$`Québec`$year == i,]$Value
  Quacbec_regression[Quacbec_regression$Year == i,]$Yield = yield_year
}

Quacbec_regression$X = NULL
Quacbec_regression$X.1 = NULL
Quacbec_regression$X.2 = NULL
Quacbec_regression$X.3 = NULL
Quacbec_regression$X.4 = NULL
Quacbec_regression$X.5 = NULL
Quacbec_regression$X.6 = NULL
Quacbec_regression$X.7 = NULL
Quacbec_regression$X.8 = NULL
Quacbec_regression$X.9 = NULL
Quacbec_regression$X.10 = NULL
Quacbec_regression$X.11 = NULL
Quacbec_regression$X.12 = NULL
Quacbec_regression$Region.1 = NULL
Quacbec_regression$Region.2 = NULL
Quacbec_regression$Region.3 = NULL
Quacbec_regression$Region.4 = NULL
Quacbec_regression$Region.5 = NULL
Quacbec_regression$Region.6 = NULL
Quacbec_regression$Region.7 = NULL
Quacbec_regression$Region.8 = NULL
Quacbec_regression$Region.9 = NULL
Quacbec_regression$Region.10 = NULL
Quacbec_regression$Region.11 = NULL
Quacbec_regression$Region.12 = NULL

na.omit(Quacbec_regression)

write.csv(Quacbec_regression, 'Quacbec_Reg_Detrend.csv')

# Saskatchewan
Saskatchewan_regression = reshape(data_Region$Saskatchewan, direction = 'wide', 
                                  idvar = 'Year', timevar = 'Month')

Saskatchewan_regression = data.frame(Saskatchewan_regression, Yield = rep(0, 22))

for (i in min(Saskatchewan_regression$Year):min(max(Saskatchewan_regression$Year),2020)){
  yield_year = yield_Region$Saskatchewan[yield_Region$Saskatchewan$year == i,]$Value
  Saskatchewan_regression[Saskatchewan_regression$Year == i,]$Yield = yield_year
}

Saskatchewan_regression$X = NULL
Saskatchewan_regression$X.1 = NULL
Saskatchewan_regression$X.2 = NULL
Saskatchewan_regression$X.3 = NULL
Saskatchewan_regression$X.4 = NULL
Saskatchewan_regression$X.5 = NULL
Saskatchewan_regression$X.6 = NULL
Saskatchewan_regression$X.7 = NULL
Saskatchewan_regression$X.8 = NULL
Saskatchewan_regression$X.9 = NULL
Saskatchewan_regression$X.10 = NULL
Saskatchewan_regression$X.11 = NULL
Saskatchewan_regression$X.12 = NULL
Saskatchewan_regression$Region.1 = NULL
Saskatchewan_regression$Region.2 = NULL
Saskatchewan_regression$Region.3 = NULL
Saskatchewan_regression$Region.4 = NULL
Saskatchewan_regression$Region.5 = NULL
Saskatchewan_regression$Region.6 = NULL
Saskatchewan_regression$Region.7 = NULL
Saskatchewan_regression$Region.8 = NULL
Saskatchewan_regression$Region.9 = NULL
Saskatchewan_regression$Region.10 = NULL
Saskatchewan_regression$Region.11 = NULL
Saskatchewan_regression$Region.12 = NULL

na.omit(Saskatchewan_regression)

write.csv(Saskatchewan_regression, 'Saskatchewan_Reg_Detrend.csv')

