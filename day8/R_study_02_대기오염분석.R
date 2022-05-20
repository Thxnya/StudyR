getwd()
setwd('C:/DEV/STUDY/StudyR/day8')
files <- c('ds.2015.csv', 'ds.2016.csv', 'ds.2017.csv', 
           'ds.2018.csv', 'ds.2019.csv')

ds <- NULL
for (f in files) {
  tmp <- read.csv(f, header = T)
  ds <- rbind(ds, tmp)
  print(f)
}
str(ds)
head(ds)
unique(ds$mdate) # levels는 팩터, unique는 그 외에 사용
range(ds$mdate)

# 열별 결측값 확인
for (i in 1:8) {
  cat(names(ds)[i], 
      sum(is.na(ds[,i])), 
      sum(is.na(ds[,i]))/nrow(ds), 
      '\n')
}
ds <- ds[,-8]                     # PM25 열 제거(결측값의 비율이 너무 높아서)
ds <- ds[complete.cases(ds),]     # 결측값이 포함된 행 제거
str(ds)

mdate <- as.character(ds$mdate)
head(mdate)
ds$year <- as.numeric(substr(mdate, 1,4))    # 연도
ds$month <- as.numeric(substr(mdate, 5,6))   # 월
ds$hour <- as.numeric(substr(mdate, 9,10))   # 시간
ds$locname <- NA
ds$locname[ds$loc==111123] <- '서울'
ds$locname[ds$loc==336111] <- '목포'
ds$locname[ds$loc==632132] <- '강릉'

head(ds)

boxplot(PM10~locname, 
        data=ds,
        main='미세먼지 농도 분포',
        ylim=c(1,100),
        xlab='지역',
        ylab='미세먼지 농도'
        )

library(ggplot2)

head(ds)
tmp.year <- aggregate(ds[,7],
                      by=list(year=ds$year, loc=ds$locname),
                      FUN='mean')
tmp.year$loc = as.factor(tmp.year$loc)
colnames(tmp.year) <- c('year', 'loc', 'PM10')
head(tmp.year)
str(tmp.year)


a <- ggplot(tmp.year, aes(x=year,y=PM10, colour=loc, group=loc)) +
  geom_line() +
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화') +
  xlab('연도') +
  ylab('농도')

# 월별
tmp.month <- aggregate(ds[,7],
                      by=list(month=ds$month, loc=ds$locname),
                      FUN='mean')
tmp.month$loc = as.factor(tmp.month$loc)
colnames(tmp.month) <- c('month', 'loc', 'PM10')
head(tmp.month)
str(tmp.month)


b <- ggplot(tmp.month, aes(x=month,y=PM10, colour=loc, group=loc)) +
  geom_line() +
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('월별 PM10 농도 변화') +
  xlab('월') +
  ylab('농도')

# 시간대별
tmp.hour <- aggregate(ds[,7],
                       by=list(hour=ds$hour, loc=ds$locname),
                       FUN='mean')
tmp.hour$loc = as.factor(tmp.hour$loc)
colnames(tmp.hour) <- c('hour', 'loc', 'PM10')
head(tmp.hour)
str(tmp.hour)


c <- ggplot(tmp.hour, aes(x=hour, y=PM10, colour=loc, group=loc)) +
  geom_line() +
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('시간별 PM10 농도 변화') +
  xlab('시간') +
  ylab('농도')

# 오염물질 농도 간의 상관관계
set.seed(1234)
plot(ds[sample(nrow(ds),5000),3:7], lower.panel=NULL)
cor(ds[,3:7])

# 미세먼지 최고점과 최저점 확인
tmp.yml <- aggregate(ds[,7],
                     by=list(year=ds$year, 
                             month=ds$month,
                             loc=ds$locname),
                     FUN='mean')
colnames(tmp.yml) <- c('year', 'month', 'loc', 'PM10')

# 가장 미세먼지가 많았던 달
idx.max <- which(tmp.yml$PM10==max(tmp.yml$PM10))
tmp.yml[idx.max,]

# 가장 미세먼지가 적었던 달
idx.min <- which(tmp.yml$PM10==min(tmp.yml$PM10))
tmp.yml[idx.min,]
