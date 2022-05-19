## 고급 그래프
# treemap
install.packages('treemap')
library(treemap)

data(GNI2014)
str(GNI2014)
levels(GNI2014$continent)

treemap(GNI2014,                          # 사용할 데이터
        index=c('continent', 'iso3'),     # 계층구조 설정
        vSize = 'population',             # 타일의 크기
        vColor = 'GNI',
        title = '대륙간 인구수/GNI',
        type = 'value',
         bg.labels = 50 # 라벨의 투명도 변경, 색 변경은 불가
       )

## LAB 미국 주요도시 통계 데이터 분석
library('carData')
head(Ericksen)
str(Ericksen)
levels(Ericksen$city)

ds <- subset(Ericksen, city=='state')
ds
ds$stname <- rownames(ds)
treemap(ds,
        index = c('stname'),
        vSize = 'poverty',
        type = 'value',
        vColor = 'crime',
        title = '미국 막장도시 찾기'
        )

## 레이더 차트
install.packages('fmsb')
library(fmsb)

score <- c(80,60,95,85,40,65)
max.score <- rep(100, 6)
min.score <- rep(0, 6)
ds <- rbind(max.score, min.score, score)
ds
class(ds)
ds <- data.frame(ds)
colnames(ds) <- c('국어','영어','수학','물리','음악','체육')
ds

radarchart(ds)

## 매개변수(옵션)
radarchart(ds,
           pcol = 'darkgreen',
           pfcol=rgb(0.2,0.5,0.5,0.5),
           plwd = 3,
           cglcol = 'grey',
           cglty = 1,
           cglwd = 0.8,
           axistype = 1,
           seg = 4,
           axislabcol = 'darkgrey',
           caxislabels = seq(0,100,25)
           )

## LAB, 종교 조사 데이터
str(WVS)
pop <- table(WVS$country)
pop 
tmp <- subset(WVS, religion == 'yes')
length(tmp$religion)
rel <- table(tmp$country)
pop
rel
 
stat <- rel / pop
stat

max.score <- rep(1, 4)
min.score <- rep(0.75, 4)
ds <- rbind(max.score, min.score, stat)
ds <- data.frame(ds)
ds

radarchart(ds,
           pcol = 'red4',
           pfcol = '#7f33337f',
           plwd = 3,
           cglcol = 'grey',
           cglty = 1,
           cglwd = 0.1,
           axistype = 1,
           seg = 4,
           axislabcol = 'grey',
           caxislabels = seq(0.6,1,0.1)
           )

## ggplot
library(ggplot2)

month <- c(1:6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month, rain)
df

ggplot(df, aes(x=month, y=rain)) +
  geom_bar(stat = 'identity',
           width = 0.7,
           fill = 'steelblue'
           )

## 막대그래프 가로
ggplot(df, aes(x=month, y=rain)) +
  geom_bar(stat = 'identity',
           width = 0.7,
           fill = 'steelblue'
          ) +
  ggtitle('월별 강수량(1월~6월)') +
  labs(x = '월', y = '강수량') +
  coord_flip() +
  theme(plot.title = element_text(size=20,
                                  face = 'italic',
                                  color = 'darkblue',
                                  hjust = 0.5))

## 히스토그램
library(ggplot2)
ggplot(data = iris, aes(x=Petal.Length)) +
  geom_histogram(binwidth = 0.5) 

ggplot(data = iris, aes(x=Sepal.Width,
                        fill = Species
                        )) +
  geom_histogram(binwidth = 0.5, position = 'dodge') +
  theme(legend.position = 'bottom') +
  ggtitle('붓꽃 품종별 꽃받침 넓이 히스토그램') +
  theme(legend.position = 'bottom')

## 산점도
library(ggplot2)
ggplot(data = iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) +
  geom_point(size = 3) +
  ggtitle('붓꽃 품종별 꽃잎 산점도') +
  theme(plot.title = element_text(size=16,
                                  face = 'bold',
                                  color = 'darkblue',
                                  hjust = 0.5))

## 선그래프
library(ggplot2)
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year, cnt)
head(df)

ggplot(data = df, aes(x=year, y=cnt)) +
  geom_line(col='red')

## LAB Airquality
library(ggplot2)
df <- aggregate(airquality[,'Temp'],
                by=list(month=airquality$Month),
                FUN = mean
                )
colnames(df) <- c('month', 'temp')

# 막대그래프
ggplot(data = df, aes(x=month, y=temp)) +
  geom_bar(stat = 'identity', width = 0.6,
           fill = 'darkgreen') +
  ggtitle('5개월 평균기온(화씨)')

# 산점도
df <- airquality[complete.cases(airquality),]
str(df)
colnames(df)
ggplot(data = df, aes(x=Temp, y=Ozone, color = 'orange')) +
  geom_point(size = 2)

cor(df$Temp, df$Ozone) # 상관관계

# 선그래프
df.7 <- subset(df, Month==7)
str(df.7)
colnames(df.7)
ggplot(data = df.7, aes(x=Day,y=Ozone)) +
  geom_line(col = 'red', linetype = 'dashed', size = 0.8) +
  geom_point(col = 'orange', size = 3) +
  ggtitle('7월 일별 오존지수') +
  theme(plot.title = element_text(size=16,
                                  face = 'bold',
                                  color = 'darkblue',
                                  hjust = 0.5)) +
  labs(x = '일', y = '오존지수')

## 실전분석
library(carData)
str(UN98)
levels(UN98$region)

df <- UN98[, c('region', 'tfr')]
df <- df[complete.cases(df),]
str(df)
df <- aggregate(df[,'tfr'], by=list(region=df$region), FUN = mean)
df

ggplot(data = df, aes(x=region, y=x)) +
  geom_bar(stat = 'identity', width = 0.8,
           col = '#333333', fill = rainbow(5)) +
  ggtitle('대륙별 평균 여성출산률') +
  theme(plot.title = element_text(size=16,
                                  face = 'bold',
                                  color = 'darkblue',
                                  hjust = 0.5)) +
  labs(x = '대륙', y = '평균출산율')

## treemap
colnames(UN98)
df.tm <- UN98[, c('region', 'lifeFemale', 'illiteracyFemale')]
df.tm <- df.tm[complete.cases(df.tm),] # 결측치 제거
str(UN98)
str(df.tm)
df.tm$country <- row.names(df.tm) # 행이름을 열로 입력해줌(행 이름으론 이용할 수 없음)
df.tm

treemap(df.tm, index = c('region','country'),
        vSize = 'lifeFemale',
        vColor = 'illiteracyFemale',
        type = 'value')

## 산점도
df.edu <- UN98[,c('region',
                  'educationMale',
                  'educationFemale')]
df.edu <- df.edu[complete.cases(df.edu),]
df.edu

ggplot(data = df.edu, aes(x=educationMale, y=educationFemale, color = region)) +
  geom_point() +
  ggtitle('대륙별 남녀 교육수준') +
  theme(plot.title = element_text(size=16,
                                  face = 'bold',
                                  color = 'steelblue',
                                  hjust = 0.5)) +
  labs(x = '교육수준(남)', y = '교육수준(여)')

cor(df.edu$educationMale, df.edu$educationFemale)
plot(UN98)
