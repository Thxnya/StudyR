## myFunc.R 내장함수
mydiv <- function(x, y=2) {
  result <- x / y
  return (result)
}

## 종업원 팁분석 내장함수
meanbycol.tip <- function(colname) {
  value <- unique(tips[, colname]) 
  result <- list()
  for(i in 1:length(value)) { 
    idx <- which(tips[,colname] == value[i])
    result[i] <- mean(tips[idx,'tip'])
  }

names(result) <- value
return (result)
}
