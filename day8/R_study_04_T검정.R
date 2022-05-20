library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

# compact 자동차와 suv 자동차의 도시 연비 t 검정

library(dplyr)
mpg_diff <- mpg %>%
  select(class, cty) %>%
  filter(class %in% c('compact', 'suv'))

unique(mpg_diff$class)
head(mpg_diff)
table(mpg_diff$class)

t.test(data = mpg_diff, cty ~ class, var.equal = T)

# 일반 휘발유와 고급 휘발유의 도시 연비 t 검정

mpg_diff2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c('r', 'p'))

table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T)

# 실업자 수와 개인 소비 지출의 상관관계
economics <- as.data.frame(ggplot2::economics)

cor.test(economics$unemploy, economics$pce)

# 히트맵 그리기
head(mtcars)

car_cor <- cor(mtcars)
round(car_cor, 2)

install.packages('corrplot')
library(corrplot)

corrplot(car_cor, method = 'number')
