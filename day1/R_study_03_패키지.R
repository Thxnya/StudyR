## 패키지 설치 및 로드
'Hello world'
"Hello World!"
install.packages('ggplot2')
library(ggplot2)
library(g.data)


ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point()

## cowsay 패키지
install.packages('cowsay')
library(cowsay)

say(what = '안녕하세요', by='random')

# 시스템 함수
Sys.Date()
Sys.time()


## 생일맞추기 - ((m*4)+9)*25 + d = (100 * m) + d + 225
# 소윤 주연 민철  석준  현석
# 931  754  1029  1139  1442
val = 754
d <- (val - 225)%%100
m <- ((val - 225) - (val - 225)%%100)/100
cat(m, '월', d, '일')
