#R言語で用意するツール
#R言語
#RSTUDIO Desktop→R言語の統合開発環境
#source("C:/Users/kinar/Documents/データサイエンス応用第１回/comment.R")
#R言語インストール後環境パスを通さなくても、RStudioが自動で、見つけ出してくれる。

#---2-1四則演算---
#累乗を含んだ結果
print(2^2*4)

#割り算の答えの整数部分を求める
print(5799844 %% 353)


#余りを求める
print(5799844 %% 353)

#---2-2関数---

#指数関数
print(exp(1))
print(exp(4))

#自然対数
print(log(54.59815))
print(log(100))

print(log10(100))
print(log2(100))

#円周率
#円周率を小数点以下2桁で求める
print(round(pi,2))

#小数点以下切り捨て
print(floor(pi))

#---2.2.1Rのヘルプ機能---
print(help("round"))
print(round(1.5432,3))

#---2-3：データ構造とその操作---

#等差数列
print(seq(10))

#2つの数字の間の整数を要素とするベクトル
print(seq(5,10))

#最後の数字で間隔を指定
print(seq(2,10,2))

#減らしていく間隔を指定
print(seq(10,1,-1))

#---2.3.1ベクトルの生成---
#10から始まり50で終わるベクトル、要素間隔は10
vec1 <- seq(10,50,10)
print(seq(10,50,10))

#50から始まり10で終わるベクトル、要素間隔は10
vec2 <- seq(50,10,-10)
print(seq(50,10,-10))

#---2.3.3比較演算---
#vec1 の各要素が vec2 の各要素より大きいかどうかを比較した結果をresult1に、等しいかどうかを比較した結果をresult2に代入
result1 <- vec1 > vec2
print(result1)

result2 <- vec1 == vec2
print(result2)


#---2-3論理演算---
#vec1とvec2のどちらかの要素が30より大きいか
result3 <- (vec1 > 30) | (vec2 > 30)
print(result3)

#vec1とvec2の両方の要素が30以上かどうか
result4 <- (vec1 >= 300) & (vec2 >= 30)
print(result4)

#---2-4ベクトルの要素の参照と抽出---
#ベクトルvec1の3番目の要素を参照する
print(vec1[3])

#30より大きい要素を抽出
greater_than_30 <- vec1[vec1 > 30]
print(greater_than_30)

#vec1の要素のうち、4の倍数の要素のみを抽出
result5 <- vec1[(vec1 %% 4 == 0)]vec1 %% 4 == 0
print(result5)

print(matrix(1:6,nrow = 2,ncol = 3,byrow = TRUE))




