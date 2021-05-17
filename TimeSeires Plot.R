library(ggplot2)
library(ggpubr)
library(zoo)

Yield = read.csv('Yield(mass-area)-Canola_Year.csv')

Variables = read.csv('Variables.csv')
Variables_new = data.frame(Variables,
                           Date = as.yearmon(paste(Variables$Year, Variables$Month), 
                                             "%Y %m"))
Var_region = split(Variables_new, Variables_new$Region)

Variables_new

Var_region$Date = as.POSIXct(Var_region$Date) 

Yield_region = split(Yield, Yield$Region)
Yield_region$End.Date = as.POSIXct(Yield_region$Date)

p1 <- ggplot(Yield_region$Canada,aes(x=year,y=Value)) + 
  geom_line(color="black") + ggtitle("Canada")

p2 <- ggplot(Yield_region$Alberta,aes(x=year,y=Value)) + 
  geom_line(color="blue") + ggtitle("Alberta")

p3 <- ggplot(Yield_region$`British Columbia`,aes(x=year,y=Value)) + 
  geom_line(color="red") + ggtitle("British Columbia")

p4 <- ggplot(Yield_region$Manitoba,aes(x=year,y=Value)) + 
  geom_line(color="cyan") + ggtitle("Manitoba")

p5 <- ggplot(Yield_region$Ontario,aes(x=year,y=Value)) + 
  geom_line(color="green") + ggtitle("Ontario")

p6 <- ggplot(Yield_region$Québec,aes(x=year,y=Value)) + 
  geom_line(color="orange") + ggtitle("Quebec")

p7 <- ggplot(Yield_region$Saskatchewan,aes(x=year,y=Value)) + 
  geom_line(color="magenta") + ggtitle("Saskatchewan")

ggarrange(p1, p2, p3, p4, p5, p6, p7, ncol = 4, nrow = 2)