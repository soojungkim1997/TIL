#Ch.5

exam <- read.csv("csv_exam.csv")
head(exam,10)
tail(exam,10)
View(exam)
dim(exam)
str(exam)
summary(exam)
install.packages("ggplot2")
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
?mpg
summary(mpg)
df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw
install.packages("dplyr")
library(dplyr)
df_new <- df_raw
df_new
df_new <- rename(df_new,v2 = var2)
df_new
df_raw
df_new
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
mpg_copy <- mpg
mpg_copy <- rename(mpg_copy,highway=hwy)
head(mpg_copy)
df <- data.frame(var1 = c(4,3,8),
                 var2 = c(2,6,1))
df
df$var_sum <- df$var1+df$var2
df
df$var_mean <- (df$var1+df$var2)/2 #var_mean 파생변수 생성
df
mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
mean(mpg$total)
summary(mpg$total)
hist(mpg$total) # 히스토그램 생성
mpg$test <- ifelse(mpg$total >=20,"pass","fail")
head(mpg,20)
table(mpg$test)
library(ggplot2)
qplot(mpg$test)
mpg$grade <- ifelse(mpg$total >=30,"A",ifelse(mpg$total>=20,"B","C"))
head(mpg,20)
table(mpg$grade)
qplot(mpg$grade)
mpg$grade2 <- ifelse(mpg$total >= 30 ,"A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >=20,"C","D")))
head(mpg)


# 분석 도전!
midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
summary(midwest)
midwest_copy <- midwest
dim(midwest)
str(midwest)
library(dplyr)
midwest_copy <- rename(midwest_copy,total=poptotal,asian = popasian)
head(midwest_copy)
midwest_copy$rate<- (midwest_copy$popasian/midwest_copy$total) *100
library(ggplot2)
hist(midwest_copy$rate)
midwest_copy$grade <- ifelse(midwest_copy$rate>mean(midwest_copy$rate),"large","small")
head(midwest_copy)
table(midwest_copy$grade)
qplot(midwest_copy$grade)
                             