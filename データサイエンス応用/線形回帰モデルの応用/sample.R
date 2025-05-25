#----------①データ準備・パッケージ読み込み----------

# CSVファイル "5-4.csv" を読み込んで、データフレーム `data` に格納する
data <- read.csv("5-4.csv")

# 読み込んだデータの構造（列の型や内容の一部）を表示する
str(data)

# glmnet パッケージ（リッジ回帰やラッソ回帰などの実装）をインストール
#install.packages("glmnet")

## plotmo パッケージ（モデルの可視化用）をインストール
#install.packages("plotmo")


## 必要なパッケージを読み込む
library(glmnet) # リッジ回帰・ラッソ回帰などを行うため
library(plotmo)# モデルの可視化を行うため
library(tidyverse)# dplyrやggplot2などの便利なパッケージ群



#----------②モデル用のデータ整形(説明変数・目的変数の準備)----------

#`data` から特定の説明変数（pAgeO75 など）を選び、行列に変換して x.Ridge に格納（リッジ回帰用）
x.Ridge <- data %>% 
  select(pAgeO75,pKakukazoku,pAgeU15,pPopRoudou,pMinsei) %>% 
  as.matrix()

# `data` から目的変数 `PersonHaishutsu` を除いたすべての列を説明変数とし、行列に変換して x.Lasso に格納（ラッソ回帰用）
x.Lasso <- data %>% 
  select(-PersonHaishutsu) %>%
  as.matrix()

# 目的変数 `PersonHaishutsu` を抽出し、行列に変換して y に格納
y <- data %>% 
  select(PersonHaishutsu) %>% 
  as.matrix()

print(head(x.Ridge,3)) # x.Ridgeの先頭3行のみを表示

print(head(x.Lasso,3)) # x.Lasso先頭の3行のみを表示

print(head(y,3))


#----------③Ridge回帰の実行と交差検証----------

# リッジ回帰モデルを構築する
# 引数 alpha = 0 により「リッジ回帰（L2正則化）」を指定（1ならラッソ回帰）
# x.Ridge：説明変数の行列、y：目的変数
data_Ridge <- glmnet(x.Ridge,y,alpha = 0)

# リッジ回帰の結果を可視化する（plotmoパッケージの機能）
# x軸を λ（正則化パラメータ）にして、各係数の変化を線で表示
# label = TRUE で各変数名のラベルを表示
plot_glmnet(data_Ridge,xvar="lambda",label=T)

# 乱数のシードを固定（再現性を保つため）
# 交差検証ではデータがランダムに分割されるため、毎回結果が少し変わる
set.seed(123) 

# リッジ回帰（alpha=0）に対して交差検証（cross-validation）を実行
# λ（罰の強さ）を様々に変えて試し、最も良いもの（汎化誤差が最小）を探す
data_Ridge_cv <- cv.glmnet(x.Ridge,y,alpha=0)

# cv.glmnet() の結果をグラフで表示
# 横軸：log(λ)、縦軸：交差検証の平均誤差（MSE）
# 点線：lambda.min（最小誤差）と lambda.1se（1標準誤差以内で最も単純なモデル）
plot(data_Ridge_cv)

# 交差検証で選ばれた、最も良かった λ（誤差が最小になった正則化パラメータ）を表示
print(data_Ridge_cv$lambda.min)

#最適な λ の対数（logスケール）を表示
print(log(data_Ridge_cv$lambda.min))
# 最適な λ（lambda.min）で学習されたリッジ回帰モデルの係数を表示

print(coef(data_Ridge_cv, s="lambda.min"))


#----------④Lasso回帰の実行と交差検証----------

#Lasso回帰モデルを構築（alpha = 1 により L1正則化＝Lassoを指定）
#x.Lasso：説明変数（全ての変数を使用）、y：目的変数
#不要な変数の係数は自動的に 0 にされ、変数選択が行われる
data_Lasso <- glmnet(x.Lasso,y,alpha=1)

# Lasso回帰の係数が λ の値によってどう変化するかを可視化する
#x軸：log(λ)、y軸：各説明変数の回帰係数の値
# label = TRUE により、線に変数名を表示
plot_glmnet(data_Lasso,xvar="lambda",label=T)

# 乱数のシードを固定（交差検証のデータ分割を毎回同じにして再現性を確保）
set.seed(123)

# Lasso回帰（alpha=1）で交差検証を実行し、最適なλ（正則化の強さ）を探索する
# 誤差が最も小さくなる λ（lambda.min）や、1標準誤差ルールで選ばれる λ（lambda.1se）などが得られる
data_Lasso_cv <- cv.glmnet(x.Lasso,y,alpha=1)

# 交差検証の結果をプロット（λと平均誤差の関係を可視化）
# 横軸：log(λ)、縦軸：平均二乗誤差（MSE）
# 点線：lambda.min（最小誤差のλ）と lambda.1se（簡単でそこそこ良いλ）
plot(data_Lasso_cv)

#交差検証の結果から、"1標準誤差ルール" に基づいて選ばれた λ の値を取得
#lambda.min より少し大きな（シンプルな）モデルで、誤差が統計的に許容範囲内のもの
data_Lasso_cv$lambda.1se

#lambda.1se の値を log（自然対数）に変換して表示
# グラフの log(λ) 軸と対応させるために使う
log(data_Lasso_cv$lambda.1se)

#lambda.1se を使って得られた Lasso回帰モデルの係数を取得
#変数選択の結果、係数が 0 になった変数は「不要」と判断されたもの
print(coef(data_Lasso_cv, s="lambda.1se"))

