#データの読み込み

data <- read.csv("5-4.csv")
print(str(data))

#lm：線形回帰モデルを作る関数
#PersonHaishutsu ~ pAge15.64：目的変数（左辺）を、説明変数（右辺）で予測するという数式
#data：作成したモデルをdata_lmという名前で保存
data_lm <- lm(PersonHaishutsu~pAge15.64, data)
#決定係数（Multiple R-squared）
#調整済み決定係数（Adjusted R-squared）
#F統計量とそのp値
#残差標準誤差
print("単回帰モデルの結果")
print(summary(data_lm))


#PersonHaishutsu を、以下の3つの変数で予測する回帰モデル
#pAge15.64（15〜64歳人口割合）
#pAgeO65（65歳以上人口割合）
#pP_IndustryWorker（第一次産業従事者の割合）
#summary結果で確認できること：
#各変数の係数（回帰パラメータ）
#決定係数（R²）・調整済みR²
#p値（各変数が統計的に意味あるか）
#残差標準誤差（予測誤差の平均的な大きさ）
lm2 <- lm(PersonHaishutsu ~ pAge15.64 + pAgeO65 + pP_IndustryWorker, data = data)
print(summary(lm2))

#すべての変数を使った回帰
print("すべての説明変数を使った回帰")
lm_all <- lm(PersonHaishutsu ~ ., data = data)
print(summary(lm_all))

#特定の変数を除いた回帰
lm_drop <- lm(PersonHaishutsu ~ . - PopTotal, data = data)
print(summary(lm_drop))

#data$pPopRoudou と data$pAge15.64 の**相関係数（ピアソンの積率相関係数）**を求めて、小数第4位まで表示
print(round(cor(data$pPopRoudou,data$pAge15.64),4))
#data 内の 全ての数値列の相関係数の行列 を計算し、小数第3位まで表示
print(round(cor(data),3))

#install.packages("car")
#library(car)
print("-----VIFを計算-----")
print(vif(lm_all))

#特定の変数を除いた重回帰モデルを2つ作成し、それぞれの AIC を比較することで、どちらのモデルがより良いかを判断する

#説明変数として 全変数を使うが、6つを除外
model_A <- lm(PersonHaishutsu~.-pAgeO65-PersonSaishutsu-PersonDoboku-PersonKyouiku-pAge15.64-pS_IndustryWorker,data)
#AIC（モデルの良さを表す指標）を表示
print(AIC(model_A))

#モデルAからさらに pKeijyou を除外したモデル
#AICを表示して、モデルAと比較
model_B <- lm(PersonHaishutsu~.-pAgeO65-PersonSaishutsu-PersonDoboku-PersonKyouiku-pAge15.64-pS_IndustryWorker-pKeijyou,data)
print(AIC(model_B))


#データを標準化して重回帰モデルで学習
# パッケージのインストール（初回のみ）
#install.packages("tidyverse")
#library(tidyverse)
data_scale <- 
  data %>%
  scale(center = TRUE, scale = TRUE) %>% 
  as.data.frame()
model_C_scaled <- lm(PersonHaishutsu ~ pAgeO75 + pKakukazoku + pAgeU15 + pPopRoudou + pMinsei, data_scale)
print(summary(model_C_scaled))



# 重回帰モデルの作成（model_C）
model_C <- lm(PersonHaishutsu ~ pAgeO75 + pKakukazoku + pAgeU15 + pPopRoudou + pMinsei, data = data)

# モデルの概要を表示
summary_C <- summary(model_C)

print("自由度調整済み決定係数の表示")
# 自由度調整済み決定係数の表示
print(cat("Adjusted R-squared:", summary_C$adj.r.squared, "\n"))

# 残差標準誤差の表示
print("残差標準誤差の表示")
print(cat("Residual Standard Error:", summary_C$sigma, "\n"))

print("# AICの表示")
# AICの表示
print(cat("AIC:", AIC(model_C), "\n"))

data_lm2 <- lm(PersonHaishutsu ~ ., data = data)

# モデルの概要を表示
print(summary(data_lm2))

print("-----------------------------")
data_lm <- lm(PersonHaishutsu~pAge15.64, data)
print(summary(data_lm))
