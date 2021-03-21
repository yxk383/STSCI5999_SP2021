Test <- read.csv("Test.txt") 
Validation<-read.csv("Training.txt") 
Training<-read.csv("Validation.txt") 
#Data visualization of Validation dataset 
library(ggplot2) 
Validation$date<-as.POSIXct(Validation$date) 
ggplot(Validation,aes(x=date,y=Temperature)) + 
  geom_line(color="brown")+ 
  scale_x_datetime(breaks ="7 hours", 
                   minor_breaks = "1 hour") 
ggplot(Validation,aes(x=date,y=Humidity)) + 
  geom_line(color="orange")+ 
  scale_x_datetime(breaks = "7 hours", 
                   minor_breaks ="1 hour") 

ggplot(Validation,aes(x=date,y=Light)) + 
  geom_line(color="green")+ 
  scale_x_datetime(breaks = "7 hours", 
                   minor_breaks ="1 hour") 
ggplot(Validation,aes(x=date,y=CO2)) + 
  geom_line(color = "purple")+ 
  scale_x_datetime(breaks = "7 hours", 
                   minor_breaks ="1 hour") 
ggplot(Validation,aes(x=date,y=HumidityRatio)) + 
  geom_line(color = "blue")+ 
  scale_x_datetime(breaks ="7 hours", 
                   minor_breaks = "1 hour") 
ggplot(Validation,aes(x=date,y=Occupancy)) + 
  geom_line(color = "red")+ 
  scale_x_datetime(breaks ="7 hours", 
                   minor_breaks = "1 hour") 
#Pairs plot(blue represents occupancy, lightblue represents non-occupancy) 
#convert time for each day into seconds (values stored in TimeinSeconds)
TimeinSeconds<-c(1:length(Validation$date)) 
for(i in 1:length(Validation$date)){ 
  TimeinSeconds[i]=(as.numeric(strsplit(format(Validation$date,"%H:%M:%S"),":")[[i]]
                               [1])*3600+ 
                      as.numeric(strsplit(format(Validation$date,"%H:%M:%S"),":")[[i]][2])*60+ 
                      as.numeric(strsplit(format(Validation$date,"%H:%M:%S"),":")[[i]][3]))} 
data<-as.matrix(cbind(Validation[,2:6],TimeinSeconds)) 
color=numeric(nrow(data)) 12
for(i in 1:nrow(data)) 
  if(Validation$Occupancy[i]=="1"){ 
    color[i]="blue" 
  }else{color[i]="lightblue"} 
pairs(data,col=color) 
#Correlation matrix and its corresponding p-value.
library("Hmisc") 
rcorr(data) 
rcorr(data)$P 
library("corrplot") 
corrplot(rcorr(data)$r,method = "circle") 
#Table 5. Dataset Description 
NumObs<-c(nrow(Training),nrow(Validation),nrow(Test)) 
count1<-0 
count2<-0 
count3<-0 
for(i in 1:nrow(Training)) 
{ if(Training$Occupancy[i]=="0") 
  count1=count1+1} 
for(i in 1:nrow(Validation)) 
{ if(Validation$Occupancy[i]=="0") 
  count2=count2+1} 
for(i in 1:nrow(Test)) 
{ if(Test$Occupancy[i]=="0") 
  count3=count3+1} 
ratio1=count1/nrow(Training) 
ratio2=count2/nrow(Validation) 
ratio3=count3/nrow(Test) 
distribution_nonoccupancy<-round(c(ratio1,ratio2,ratio3),3) 
distribution_occupancy<-round(c(1-ratio1,1-ratio2,1-ratio3),3) 
data.frame("Data set"=c("Training","Validation","Test"), 
           "Number of observations"=NumObs, 
           "Non-occupancy rate"=distribution_nonoccupancy, 
           "Occupancy rate"=distribution_occupancy)