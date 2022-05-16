## 데이터 입출력
setwd('C:/DEV/STUDY/StudyR/day4') # working 디렉토리 지정
print('Hello R!!')

# 실행결과를 저장
sink('result.txt', append = T) # append -> 이전 문서 뒤, 내용 계속 붙이기

a <- 10; b <- 20
cat('a+b=', a + b, '\n')

sink()

sink('result.txt', append = T)

iris
iris.setosa <- subset(iris, Species == 'setosa')
iris.setosa

sink()

## txt 파일 읽기/ 구분자 공백 또는 탭
air.txt <- read.table('./airquality.txt', header = T, sep=' ')
air.txt # header가 F일 경우 열 제목이 행에 포함됨

# csv파일도 read.table()로 로드 가능 sep=','
air.csv <- read.table('../day3/airquality.csv', header = T, sep=',')
air.csv

## LAB 체질량 지수 계산 2
library(svDialogs)

height <- dlgInput('키를 입력하세요(cm)')$res
weight <- dlgInput('몸무게를 입력하세요(kg)')$res

height <- as.numeric(height)
weight <- as.numeric(weight)

height.res <- height / 100
bmi <- weight / (height.res^2)

sink('bmi.txt', append = T)
cat('height', 'weight', 'bmi\n')
cat(height, weight, bmi)
cat()
sink()

result <- read.table('./bmi.txt', header = T, sep = ' ')
result

names(result) <- c('키','몸무게','체질량지수')
result
write.table(result, './bmi2.txt', row.names = F)

## 엑셀 패키지
install.packages('readxl') # 엑셀 읽기용 패키지
library(readxl)

air.xlsx <- read_excel('../day3/airquality.xlsx')
air.xlsx

install.packages('openxlsx') # 엑셀 쓰기용 패키지
library(openxlsx)

write.xlsx(result, 'bmi_result.xlsx', rowNames = F)

## 실전분석 차정보 조회
library(svDialogs)
library(readxl)
library(openxlsx)
carprice.new <- read.csv('./carprice.csv', header = T)
carprice.new
str(carprice.new)

input.type <- dlgInput('차량타입 입력(Small, Midsize, Large, Sporty, Van, Compact)')$res
input.city <- dlgInput('최소 시내연비 입력')$res
input.city <- as.numeric(input.city)

result <- subset(carprice.new, Type == input.type & MPG.city >= input.city)
result

write.xlsx(result, './van_result.xlsx', rowNames = F)

getwd()

## Oracle 연동
install.packages('rJava')
install.packages('RJDBC')
library(rJava)
library(RJDBC)

# DB연결 설정
jdbcDriver <- JDBC(driverClass = 'oracle.jdbc.OracleDriver',
                   classPath = './day4/ojdbc6.jar')
# PASS