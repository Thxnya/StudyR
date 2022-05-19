## 메모리 문제 RStudio가 느려질때 해결
# R에 있는 파일을 싹다 지우는 함수
rm(list = ls())
gc() # garbage collection

# Tools > Global Options
# Generals > Restore previously open source documents at startup