# 포브스 데이터셋 분석
install.packages('HSAUR')
library(HSAUR)

data('Forbes2000')
str(Forbes2000)
levels(Forbes2000$country)
levels(Forbes2000$category)
ds <- Forbes2000
ds[!complete.cases(ds),] # 결측값확인

head(ds)
View(ds)

# 기업이 많은 나라 상위 10개국
tmp <- table(ds$country)
tmp <- sort(tmp, decreasing = T)
top.10.country <- tmp[1:10]
top.10.country

par(mar=c(9,4,4,2))

barplot(top.10.country,
        main = '기업수 상위 10개국',
        col = rainbow(10),
        las = 2)

par(mar=c(5,4,4,2))

# 수가 많은 상위 10개 업종
tmp.2 <- table(ds$category)
tmp.2 <- sort(tmp.2, decreasing = T)
top.10.category <- tmp.2[1:10]
top.10.category
color.category <- c('#FF0000', '#FF0033', '#FF3333', '#FF0066', '#FF0099', 
                    '#FF6666', '#FF9999', '#FFCCCC', '#CC9999', '#996666')

par(mar=c(10,4,4,2))

barplot(top.10.category,
         main = '기업수 상위 10개 업종',
         col = color.category,
         las = 2)

par(mar=c(5,4,4,2))

# 업종별 기업자산 분포
tmp.3 <- ds[ds$category %in% names(top.10.category),] # 상위 10개 업종만 남김
str(tmp.3)
str(ds)
levels(tmp.3$category)
tmp.3$category <- factor(tmp.3$category) # 빈도수가 0인 category를 없애줌
levels(tmp.3$category)

par(mar=c(10,4,4,2))

boxplot(assets~category, 
        data = tmp.3,
        ylim = c(0,100),
        xlab = ' ',
        las  =2
        )

par(mar=c(5,4,4,2))

# 기업 가치 상위 10대 기업
tmp.4 <- ds[order(ds$marketvalue, decreasing = T),]
tmp.4[1:10,c('name','country','category','marketvalue')]

# sort()는 주어진 데이터를 직접 정렬해주는 함수이고 
# order()는 데이터를 정렬했을 때의 순서를 반환한다.

# 한국 기업 정보
korea <- subset(ds, country=='South Korea')
korea[,c('rank', 'name', 'category', 'marketvalue')]

# 기업 가치와 타 변수와의 상관관계
str(ds)
tmp.5 <- ds[,5:8]
tmp.5 <- tmp.5[complete.cases(tmp.5),]
plot(tmp.5, lower.panel=NULL) # lower.panel=NULL 아래쪽 산점도 없애줌
cor(tmp.5)
