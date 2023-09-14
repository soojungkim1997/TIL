# Ch.8 그래프 만들기
# 8-2 산점도 - 변수 간 관계 표현하기기
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6) + ylim(10,30)

# 혼자서 해보기
ggplot(data=mpg,aes(x=cty,y=hwy))+geom_point()
midwest <- as.data.frame(ggplot2::midwest)
ggplot(midwest,aes(x=poptotal,y=popasian)) + geom_point() + xlim(0,500000)+ ylim(0,10000)

# 8-3 막대그래프 - 집단 간 차이 표현하기
library(dplyr)
df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy=mean(hwy))
ggplot(data = df_mpg,aes(x = reorder(drv,-mean_hwy), y= mean_hwy)) + geom_col()
ggplot(data=mpg,aes(x=drv))+geom_bar()
ggplot(data=mpg,aes(x=hwy))+geom_bar()

# 혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
mpg_df <- mpg %>%
  filter(class=="suv") %>%
  group_by(manufacturer) %>%
  summarise(cty_mean = mean(cty)) %>%
  arrange(desc(cty_mean)) %>%
  head(5)
  
ggplot(data=mpg_df,aes(x=reorder(manufacturer,-cty_mean),
                       y=cty_mean)) +geom_col()  
ggplot(data=mpg,aes(x=class)) + geom_bar()

# 8-4. 선그래프 - 시간에 따라 달라지는 데이터 표현하기
ggplot(data=economics,aes(x=date,y=unemploy)) +geom_line()

#혼자서 해보기
ggplot(data=economics,aes(x=date,y=psavert))+geom_line()

#8-5. 상자그림 - 집단 간 분포차이 표현하기
ggplot(data=mpg,aes(x=drv,y=hwy))+geom_boxplot()

# 혼자서 해보기
df <- mpg %>% filter(class %in% c("compact","subcompact","suv")) 
ggplot(data=df,aes(x=class,y=cty)) + geom_boxplot()              
