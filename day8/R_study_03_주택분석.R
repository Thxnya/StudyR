getwd()

library(data.table)
install.packages('dplyr')
library(dplyr)
library(ggplot2)
install.packages('lubridate')
library(lubridate)
library(stringr)
install.packages('forecast')
library(forecast)
install.packages('randtests')
library(randtests)

load(file='./result_sales_dt.RData')

str(result_sales_dt)
glimpse(result_sales_dt, width=60)
unique(result_sales_dt$yyyyqrt)

# 분기별 매매량 계산
qrt_cnts <- result_sales_dt[,.N,yyyyqrt]
str(qrt_cnts)
head(qrt_cnts)
tail(qrt_cnts)
qrt_cnts <- result_sales_dt[yyyyqrt != '2015Q2', .N,yyyyqrt]

ggplot(qrt_cnts, aes(x=yyyyqrt, y=N, group = 1)) +
  geom_line() +
  xlab('년도분기') +
  ylab('매매건수') +
  theme(axis.text.x=element_text(angle=90)) +
  stat_smooth(method='lm')

# 분기별/지역별 매매추이
region_cnts <- result_sales_dt[yyyyqrt != '2015Q2', .N, .(yyyyqrt,region)]

ggplot(region_cnts, aes(yyyyqrt, N, group=region)) +
  geom_line() +
  facet_wrap(~region,scale='free_y', ncol=3) +
  stat_smooth(method = 'lm') +
  theme(axis.text.x = element_blank())

# 시계열의 랜덤성 검정
region_cnts <- result_sales_dt[, .N, .(yyyyqrt,region)]

regions <- unique(region_cnts$region)

runs_p <- c()
for (reg in regions) {
  runs_p <- c(runs_p, runs.test(region_cnts[region %chin% reg,N])$p.value)
}

ggplot(data.table(regions, runs_p), aes(x=regions, y=runs_p, group=1)) +
  geom_line() +
  geom_point() +
  ylab('P-value') +
  xlab('지역')

# 시계열 분할(서울지역)
seoul_cnts <- result_sales_dt[yyyymm != '201504' & region %chin% '서울',.N,.(yyyymm)]
tot_ts <- ts(seoul_cnts$N, start = c(2006,1), frequency = 12)
plot(stl(tot_ts, s.window = 'periodic'))

# 시계열 분할에 대한 모형가정
arima_mdl <- auto.arima(tot_ts)
tsdiag(arima_mdl)

# 아리마 모델을 이용한 예측
plot(forecast(arima_mdl, h=12)) 


