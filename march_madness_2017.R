#predicting wins for 2017 March Madness 
march_2017<-read.csv(file.choose(),header=TRUE)
march_2017$Distance.regional<-as.factor(march_2017$Distance.regional) #distance traveled to the regional site 
march_2017$Power<-as.factor(march_2017$Power) #Power conference binary label 
library(randomForest)

#random forest model 
modelMarch <- randomForest(wins~.,data=x4[4:49],importance=TRUE, ntree=4000, mtry = 10, do.trace=100)
plot(modelMarch)
varImpPlot(modelMarch)
#Predict wins from the random forest model 
march_2017$predWins=predict(modelMarch,march_2017, predict.all=FALSE)
predWins<-subset(x4,Season=="2017",select=c(Team,Season,seed,predWins,wins,BPI.RK))














