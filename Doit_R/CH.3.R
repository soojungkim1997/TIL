# CH.3 

b <-2
b*3
var1 <-c(1,2,5,7,8)
var2<-c(1:5)
var3<-seq(1,5)
var4 <- seq(1,10,by=2)
var5 <- seq(1,10,by=3)
var5
var1
var1+2
var1+var2
str1 <-"a"
str1
str4 <- c("a","b","c")
str4
str1+2
x <- c(1,2,3)
x
mean(x)
max(x)
min(x)
str5 <- c("Hello!", "World", "is", "good")
str5
paste(str5,collapse=",")
str5_paste <- paste(str5,collapse=" ")
str5_paste
x_mean <-mean(x)
x_mean
install.packages("ggplot2")
library(ggplot2)
x <- c("a","a","b","c")
x
qplot(x)
qplot(data=mpg,x=hwy)
qplot(data=mpg,x=drv,y=hwy)
qplot(data=mpg,x=drv,y=hwy,geom="line")
qplot(data=mpg,x=drv,y=hwy,geom="boxplot")
qplot(data=mpg,x=drv,y=hwy,geom="boxplot",colour=drv)
?qplot

#Q1~#Q3
score <- c(80,60,70,50,90)
score
score_mean <-mean(score)
score_mean
