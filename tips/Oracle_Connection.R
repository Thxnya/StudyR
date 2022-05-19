## Oracle 연결
# ROracle 패키지는 잘안됨
# JDBC = Java DB Connectity
# 한글입력 DBMSencoding = 'euc-kr' / 'utf-8' 둘다 해보기
# 1. RODBC 패키지 설치
install.packages('RODBC') # ROracle Open DataBase Connectity
# 2. 라이브러리 추가
library(RODBC)

## 3. ODBC 데이터원본(64비트) 설정
conn1 = odbcConnect('SCOTT_DSN', uid = 'scott', pwd = 'tiger',
                    DBMSencoding = 'EUC-KR',
                    believeNRows = F)

## 4. 연결확인
summary(conn1)

## 5. 쿼리 실행
res <- sqlQuery(conn1, 'SELECT * FROM dept')
str(res)

res <- sqlQuery(conn1, 'SELECT * FROM membertbl')

## 6. 접속끊기
odbcClose(conn1)
res
