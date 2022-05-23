## 1번문제
#1)
seq(1.0, 3.0, 0.2)
#2)
x <- 1:11
rep(x[1:3], times=3)

## 2번문제
max.temp <- c(22,27,26,24,23,26,28)
names(max.temp) <- c('월','화','수','목','금','토','일')

barplot(max.temp,
        main = '주간 최대 기온',
        xlab = '섭씨',
        ylab = '요일',
        col = rainbow(7),
        horiz = T,
        las = 2
        )

## 3번문제
str(trees)

plot(trees$Girth, 
     trees$Volume,
     pch = 16,
     main = '나무 둘레-용적 산점도',
     xlab = '둘레',
     ylab = '용적',
     col = '#84CDEA',
     )

## 4번문제
str(airquality)

color.oz <- rep('#A8DADC', 9)
color.oz[1] <- '#1D3557'
color.tmp <- rep('#A8DADC', 5)
color.tmp[4] <- '#1D3557'
color.sol <- rep('#A8DADC', 7)
color.sol[6] <- '#1D3557'
color.wind <- rep('#A8DADC', 5)
color.wind[2] <- '#1D3557'

par(mfrow=c(2,2))

hist(airquality$Ozone,
     main = '오존분포',
     xlab = '오존',
     col = color.oz
     )
hist(airquality$Temp,
     main = '기온분포',
     xlab = '기온',
     breaks = 5,
     col = color.tmp
     )
hist(airquality$Solar.R,
     main = '자외선분포',
     xlab = '자외선',
     col = color.sol
     )
hist(airquality$Wind,
     main = '풍량분포',
     xlab = '풍량',
     breaks = 5,
     col = color.wind
     )

par(mfrow=c(1,1))

## 5번문제
install.packages('carData')
library(carData)
str(TitanicSurvival)
head(TitanicSurvival)

tit.surv <- TitanicSurvival[complete.cases(TitanicSurvival),]
str(tit.surv)

a <- tit.surv[tit.surv$survived == 'yes',]
a <- table(a$passengerClass)
b <- tit.surv[tit.surv$survived == 'no',]
b <- table(b$passengerClass)
class.surv <- rbind(a, b)

barplot(class.surv,
        main = '타이타닉 클래스별 생존자',
        names = c('First', 'Second', 'Third'),
        col = rainbow(2),
        legend.text = c('생존자', '사망자'),
        args.legend = list(x='topleft', inset=c(0.075,0))
        )
        

