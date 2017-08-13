setwd("~/R/linearRegression")
cricket <- readRDS("cricket.rds")

#formula
fmla = temperature ~ chirps_per_sec

#linear model
cmodel = lm(formula = fmla, data = cricket)

#view the model
cmodel
summary(cmodel)
glance(cmodel)

library(ggplot2)

#plot the data
g <- ggplot(cricket, aes(x = chirps_per_sec, y = temperature)) + 
     geom_point()
g

#add new variable colum, "prediction"
cricket$prediction = predict(cmodel)
#plot our predicted linear model
g + geom_line(data = cricket, aes(x=chirps_per_sec, y=prediction), colour = "red")
  + ggtitle("temperature vs. linear model prediction")


#or automatic by ggplot
g <-  g +
      geom_smooth(method='lm') +
      ggtitle("temperature vs. linear model prediction (of ggplot)")
g