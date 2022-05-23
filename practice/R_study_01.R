(73 %% 8) + 10
max(6, 1, 3, 7) - min(6, 1, 3, 7)
5*10/2
3.14*10*10
5*60*60+48*60+32
10000-(5*1000+500*3)
max(63,95,84,36,48)*500

install.packages('dplyr')
library(dplyr)
install.packages('cowsay')
library(cowsay)
say()

help(ceiling)

## (((mm * 4) + 9) * 25) + dd = abc
## 100mm+ dd + 225 = abc
a <- c('소윤','주연','민철','석준','현석')
b <- c(931,754,1029,1139,1442)
b <- b - 225
b <- b / 100
c <- rbind(a, b)
class(c)
d <- c(931,754,1029,1139,1442)
names(d) <- c('소윤','주연','민철','석준','현석')
class(d)
c
d

a <- "Hello World!"
b <- "R programming"
c <- paste(A,B)
print(c)

37+7
4*5-10
99/3
152%%7
5^2
2^10
(11*4)-(13%%4)
(9-7)%%3
max(20,11,17,21,19)
min(20,11,17,21,19)
abs(-20)
sqrt(25)

salt <- 50
water <- 100
result <- salt / (salt+water) * 100
cat('소금 =',salt,', 물 =',water,' : 농도 =',result,'%')

help(rep)

v <- rep(c('a','b','c'), times = 3)
v
v <- rep(c('a','b','c'), each = 3)
v

play <-  c(421,298,254,232,239,368,465)
play
play[c(3,5)] <- c(267,241)
play

name <- c('kim', 'lee', 'park', 'choi', 'seo')
deposit <- c(5000000,4500000,4000000,5500000,6000000)
rate <- c(3.5,3,4,5,4.5)
period <- c(2,2,5,7,4)

names(deposit) <- name
names(rate) <- name
names(period) <- name

who <- 'kim'

sum <- deposit[who] * (1 + rate[who]/100)^period[who]
sum

for (i in name[1:5]) {
  sum <- deposit[i] * (1 + rate[i]/100)^period[i]
  print(sum)
}

sales <- c(750,740,760,680,700,710,850,890,700,720,690,730)
names(sales) <- paste(1:12, '월', sep='')
sales

sales['7월']
length(sales)

a <- 7; b <- 9
c <- a*b
c
a <- 90; b <- 60; c <- 80
d <- 360 -a -b -c
d
a <- 4; b <- 3
s <- a*b/2
s
v1 <- 20; v2 <- 30
avg <- (60/v1) + (60/v2)
avg
sugar <- 25
water <- 125
percent <- sugar / (sugar+water) * 100
print(percent)
v <- c(92,73,55,28,19)
v1 <- c('cyan','magenta','yellow','black')
v2 <- c(TRUE, FALSE, TRUE)
v3 <- c(37.5,8.2,9.6,11.8,24.9)
v <- c(1,2,3,4)
sum(v)
v1 <- c('T','T','T','F','T','F','F','T','T','F')
sum(v1)
v2 <-  c(T,T,T,F,T,F,F,T,T,F)
sum(v2)
sum(1:5000)
even <- seq(2,100,2)
sum(even)
d <- c(1:100)
odd <- d[seq(1,100,2)]
odd[1:40]
pick <- odd[c(3,7,32)]
names(pick) <- c('3rd','7th','32th')
pick[-2]
pick['3rd'] <- 3
pick

a <- c(3,6,9,12,15)
b <- c(18,21,24,27,30)
x <- c(a,b)

a <- seq(from = 20, to = 80, by = 7)
length(a)
sort(a, decreasing = T)
max(a)
min(a)
range(a)
mean(a)
median(a)
var(a)
sd(a)

a <- 30:120
condi <- a %% 3 == 0
sum(condi)
a[condi]
sum(a[condi])

a <- c('red','white','brown','green','white','red','brown','white')
b <- factor(a)
levels(b)
as.integer(b)

day <- c('Tue', 'Wed', 'Sat')
oneday_class <- list(class='sun_catcher',
                     day,
                     price=60000,
                     parking=TRUE)
oneday_class[2]
oneday_class$price
v1 <- c(6,1,3,7,9)
v2 <- c(9,1,0,3,7)
v2 + c(1,2,-1,3,-5)
v1 + v2
v1*2
v2-3
3*v1-v2
a <- 25:150
condi <- a %% 3 == 0 & a<100
sum(condi)
a <- c('good', 'great','bad', 'okay', 'good', 'bad', 'good')
f <- factor(a)
levels(f)
name <- c('shoes', 'pants', 'tshirts')
price <- c(76000,52000,36000)
promotion <- c(0.05,0.1,0.05)
names(price) <- name
names(promotion) <- name
sum(price*(1-promotion))
weight <- c(56,23,89,46,76,14,97,72,68,62,35)
names(weight) <- c('a','b','c','d','e','f','g','h','i','j','k')
weight <- sort(weight)
length(weight)

for (i in 1:11){
  if (y <- sum(weight) - weight[i] <= 600) {
    print(y)
    break
  }
}

a <- c('여름','봄','여름','겨울','봄','겨울','여름','여름','봄','가을')
favorite <- factor(a)
levels(favorite)

post <- list(user_id='mr_steve',
             post_id='p11010',
             view=37,
             image=FALSE,
             like=c('creeper','alex','skeleton','enderman')
             )
post

account <- list(name='하늘',
                number='123-468-120566',
                balance=4128750,
                history=c(-50000,20000,-32500,-79000,42000)
                )
a <- sum(account$history <= 0)
b <- sum(account$history >= 0)
cat('입금 건수는',b,'출금 건수는',a)

v <- seq(5,60,5)
a <- matrix(v, nrow=3, byrow=T)
b <- matrix(v, ncol=4)
a
b
c <- rbind(a,b)
d <- cbind(a,b)
c
d

m <- matrix(seq(1,23,2), nrow=3)
m[1,2]
m[2,]
m[,4]
m[c(1,3),c(3,4)]
m <- matrix(c(50,5,10,100), nrow = 2)
rownames(m) <- c('act_Y', 'act_N')
colnames(m) <- c('prd_Y', 'prd_N')
m["act_N","prd_N"]

title <- c('명량','신과함께','국제시장','아바타','베테랑')
screen <- c(1587,1912,966,912,1064)
rank <- c(1,2,3,4,5)

movie <- data.frame(rank,title,screen)

iris[1:10, -5]
dim(iris)
str(iris)

data(sleep)
sleep[1:10,]
tail(sleep, n=8)
dim(sleep)
nrow(sleep)
ncol(sleep)
colnames(sleep)
sleep
str(sleep)
levels(sleep$group)
table(sleep$group)

colSums(mtcars)
colMeans(mtcars)
rowSums(mtcars)
rowMeans(mtcars)

class(mtcars)
is.matrix(mtcars)
is.data.frame(mtcars)
mtcars.m <- as.matrix(mtcars)

m <- matrix(c(9,7,5,3,8,11,2,9), nrow=2, byrow = T)
rownames(m) <- c('x','y')
colnames(m) <- c('a','b','c','d')
m <- t(m)
df <- data.frame(m)
df[,'info']
