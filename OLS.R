library('dplyr')
library('MASS')


whole.na = read.csv('D://E-Angel//Documents//RStudio//STSCI5999//STSCI5999_SP2021//OLS.csv')

attach(whole)
whole$X = NULL
whole$Year = NULL
whole.na = na.omit(whole.na)
lm.whole = lm(Yield ~ ., whole)
summary(lm.whole)


glm.try <- glm(Yield ~ .,data=whole.na) 
# Backward selection
backward <- stepAIC(glm.try, direction="backward",data=whole.na)
backward$anova

# The Lasso
cv.out=cv.glmnet(x,y,alpha=1) #10 fold cross validation
bestlam=cv.out$lambda.min
bestlam
lasso.mod=glmnet(x,y,alpha=1,lambda=bestlam)
lasso.coef=coef(lasso.mod)[,1]
lasso.coef[lasso.coef!=0]

pred.lasso = predict(lasso.mod, s = bestlam, newx = x)

