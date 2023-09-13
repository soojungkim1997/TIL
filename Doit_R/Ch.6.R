# Ch.6
# 6-2. 조건에 맞는 데이터만 추출하기

library(dplyr)
exam <- read.csv("csv_exam.csv")
exam
exam %>% filter(class ==1)
exam %>% filter(class == 2)
exam %>% filter(math>50)
exam %>% filter(math<50)
exam %>% filter(class ==1 & math >=50)
exam %>% filter(class ==2 & english >=80)
exam %>% filter(math>=90 | english >=90)
exam %>% filter(class==1 | class==3 | class ==5)
exam %>% filter(class %in% c(1,3,5))
class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class==2)
mean(class1$math)
mean(class2$math)

# 혼자서 해보기
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
displ1 <- mpg %>% filter(displ<=4)
displ2 <- mpg %>% filter (displ >=5)
mean(displ1$hwy)
mean(displ2$hwy)

head(mpg)
audi <- mpg %>% filter(manufacturer == 'audi')
toyota <- mpg %>% filter(manufacturer =='toyota')
mean(audi$cty)
mean(toyota$cty)
manu <- mpg %>% filter(manufacturer %in% c('chevrolet','ford','honda')) 
mean(manu$hwy)

#6-3. 필요한 변수만 추출하기

exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)
exam %>% select(-math)
exam %>% select (-math,-english)
exam %>% filter(class == 1) %>%
         select(english)
exam %>%
  select(id,math) %>%
  head
exam %>%
  select(id,math) %>%
  head(10)

# 혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg %>% select(class,cty)
mpg_new1 <- mpg_new %>% filter(class=='suv')
mpg_new2 <- mpg_new %>% filter(class == 'compact')
mean(mpg_new1$cty)
mean(mpg_new2$cty)

#6-4. 순서대로 정렬하기
exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class,math)

#혼자서 해보기
mpg_audi <- mpg %>% filter(manufacturer =='audi')
mpg_audi %>% arrange(desc(hwy)) %>% 
  head(5)

# 6-5. 파생변수 추가하기
exam %>%
  mutate(total = math + english + science) %>%
  head
exam %>%
  mutate(total = math+english+science,
         mean = (math+english+science)/3) %>%
  head
exam %>%
  mutate(test=ifelse(science>=60,"pass","fail")) %>%
  head
exam %>%
  mutate(total = math + english + science) %>%
  arrange(total) %>%
  head

# 혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
mpg_copy <- mpg
mpg_copy <- mpg_copy %>% mutate('total' = cty+hwy)
mpg_copy <- mpg_copy %>% mutate('mean'=total/2)
mpg_copy %>% arrange(desc(mean)) %>% head(3)
mpg <- mpg %>% mutate('total' = cty+hwy,'mean'=total/2) %>%
  arrange(desc(mean)) %>% 
  head(3)

# 6-6. 집단별로 요약하기
exam %>% summarise(mean_math = mean(math)) # math 평균 산출
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())
mpg %>%
  group_by(manufacturer,drv) %>%
  summarise(mean_cty = mean(cty)) %>%
  head(10)
mpg %>%
  group_by(manufacturer) %>%
  filter(class=='suv') %>%
  mutate(tot = (cty+hwy)/2) %>%
  summarise(mean_tot = mean(tot)) %>%
  arrange(desc(mean_tot)) %>%
  head(5)

# 혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
mpg %>%
  group_by(class) %>%
  summarise(cty_mean = mean(cty)) %>%
  arrange(desc(cty_mean)) %>%
  head(3)
mpg %>% filter(class =='compact') %>%
  group_by(manufacturer) %>%
  summarise(count = (n())) %>%
  arrange(desc(count))

#6-7. 데이터 합치기
test1 <- data.frame(id=c(1,2,3,4,5),
                    midterm=c(70,83,65,95,80))
test2 <- data.frame(id=c(1,2,3,4,5),
                    final=c(70,83,65,95,80))
test1
test2
total <- left_join(test1,test2,by="id")
total
name <-data.frame(class=c(1,2,3,4,5),
                  teacher=c("kim","lee","park","choi","jung"))
name
exam_new <-left_join(exam,name,by="class")
exam_new
group_a <- data.frame(id=c(1,2,3,4,5),
                      test=c(60,80,70,90,85))
group_b<-data.frame(id=c(6,7,8,9,10),
                    test=c(70,83,65,95,80))
group_a
group_b
group_all <-bind_rows(group_a,group_b)
group_all

# 혼자서 해보기
fuel <-data.frame(fl=c("c","d","e","p","r"),
                  price_fl=c(2.35,2.38,2.11,2.76,2.22))
fuel
mpg<-as.data.frame(ggplot2::mpg)
mpg<- left_join(mpg,fuel,by="fl")
mpg %>% select(model,fl,price_fl) %>%
  head(5)

# 분석과제 도전하기
library(ggplot2)
library(dplyr)
midwest <- as.data.frame(ggplot2::midwest)
midwest <- midwest %>% mutate(rate = (poptotal-popadults)/poptotal*100)
midwest %>%
  select(county,rate) %>%
  arrange(desc(rate)) %>%
  head(5)
midwest <- midwest %>%
  mutate(grade=ifelse(rate>=40,"large",
                       ifelse(rate>=30,"middle","small")))
table(midwest$grade)                                     
midwest %>%
  mutate(asian_rate = (popasian/poptotal)*100) %>%
  arrange(asian_rate) %>%
  select(state,county,asian_rate) %>% 
  head(10)
