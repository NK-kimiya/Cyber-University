#-----アヤメのデータセットをダウンロード-----

#Rに組み込まれている「iris（アヤメの花）」データセットを読み込み
print(data(iris)　)
#「iris」データの先頭6行を表示
print(head(iris) )
#「iris」データの各列（変数）について、基本統計量を表示
print(summary(iris))


#データフレームの特定の列を取り出すときに $（ドル記号） を使用
#iris$Sepal.Length：irisデータセットの「がく片の長さ」の列
#hist()：ヒストグラムを描く関数
#main：グラフのタイトル → 「がく片の長さの分布」
#xlab：x軸のラベル → 「がく片の長さ」
#ylab：y軸のラベル → 「個体数」
#col：棒グラフの色 → 水色 ("lightblue")
#border：棒の境界線の色 → 黒 ("black")
hist(iris$Sepal.Length, main="がく片の長さの分布", xlab="がく片の長さ", ylab="個体数", col = "lightblue", border = "black")

#iris$Sepal.Length：irisデータセットの「がく片の幅」の列
#hist()：ヒストグラムを描く関数
#main：グラフのタイトル → 「がく片の幅の分布」
#xlab：x軸のラベル → 「がく片の幅」
#ylab：y軸のラベル → 「個体数」
#col：棒グラフの色 → 水色 ("lightblue")
#border：棒の境界線の色 → 黒 ("black")
hist(iris$Sepal.Width, main="がく片の幅の分布", xlab="がく片の幅", ylab="個体数", col = "lightblue", border = "black")

#階級数を20に設定
#「データの最小値〜最大値の範囲」を**約20個の等間隔の区間（階級）**に分けて、
#それぞれに含まれるデータの個数（頻度）を棒で描画
hist(iris$Sepal.Length, main="がく片の長さの分布（階級数20）", xlab="がく片の長さ", ylab="個体数", col = "lightblue", border = "black", breaks = 20)

#log2(データ数)の計算で適切な階級数を求める
print(1+log2(150))

#がく片の長さを4.0 から 8.0 までを 階級幅1.0 間隔で分布する
hist(iris$Sepal.Length, main="がく片の長さの分布（階級幅を1.0に指定）", xlab="がく片の長さ", ylab="個体数", col = "lightblue", border = "black", breaks = seq(4.0, 8.0, by = 1.0) )


#boxplot：箱ひげ図を描画
#iris$Sepal.Length：がく片の長さの分布
#main：グラフのタイトル
#ylab：y軸ラベル
#col：箱（ボックス）の色
boxplot(iris$Sepal.Length, main = "がく片の長さの分布", ylab = "Sepal Length", col = "lightblue")

#boxplot：箱ひげ図を描画
#iris[, 1:4]：iris データの 1列目〜4列目を抽出
#main：グラフのタイトル（がく片と花弁の長さの分布）
#names：各箱のラベル（日本語でカスタマイズ）
#col：各箱の色（それぞれ異なる色でわかりやすく）
boxplot(iris[, 1:4], main = "がく片と花弁の長さの分布", names = c("がく片の長さ", "がく片の幅", "花弁の長さ", "花弁の幅"), col = c("lightblue", "lightgreen", "lightpink", "lightyellow"))

#boxplot：箱ひげ図を描画
#Sepal.Length ~ Species：Species（種）ごとにSepal.Length（がく片の長さ）を比較
#data = iris：iris データセットから変数を取得
#main：グラフのタイトル
#xlab, ylab：x軸・y軸のラベル
#names：各種の名前を日本語で表示
#col：各箱の色（種ごとに違う色）
boxplot(Sepal.Length ~ Species, data = iris, main = "種ごとのがく片の長さ分布の比較", xlab = "アヤメの種", ylab = "がく片の長さ", names = c("セトーサ", "バーシカラー", "バージニア") , col = c("lightblue", "lightgreen", "lightpink"))

#boxplot：箱ひげ図を描画
#Petal.Length ~ Species：Species（種）ごとにPetal.Length（がく片の幅）を比較
#data = iris：iris データセットから変数を取得
#main：グラフのタイトル
#xlab, ylab：x軸・y軸のラベル
#names：各種の名前を日本語で表示
#col：各箱の色（種ごとに違う色）
boxplot(Petal.Length ~ Species, data = iris, main = "種ごとの花弁の長さ分布の比較", xlab = "アヤメの種", ylab = "花弁の長さ", names = c("セトーサ", "バーシカラー", "バージニア") , col = c("lightblue", "lightgreen", "lightpink"))


#iris[, 1:4]：irisデータの1〜4列目（Sepal.Length, Sepal.Width, Petal.Length, Petal.Width）だけを抽出
#cor()：**相関係数（ピアソンの積率相関）**を計算する関数
#各列同士の相関をすべて計算して**相関行列（correlation matrix）**として返す
cor_matrix <- cor(iris[, 1:4])
print(cor_matrix)

#plot(x, y)：
#x軸に iris$Sepal.Length（がく片の長さ）、
#y軸に iris$Petal.Length（花弁の長さ）を使って散布図を描画
#がく片の長さが長いほど、花弁の長さも長くなる傾向（相関）を視覚的に確認
plot(iris$Sepal.Length, iris$Petal.Length, main = "がく片の長さと花弁の長さの散布図",xlab = "がく片の長さ", ylab = "花弁の長さ", col = "blue", pch = 19)

#pairs(iris[, 1:4])：
#irisデータの 1〜4列目（数値変数だけ）を使って
#それぞれの変数同士の 散布図をすべての組み合わせで描画
#対象の変数：Sepal.Length（がく片の長さ）、Sepal.Width（がく片の幅）、Petal.Length（花弁の長さ）、Petal.Width（花弁の幅）
#main = "Irisデータの散布図行列"：グラフ全体のタイトルを設定
# col = iris$Species：
#種（Species）ごとに点の色を変える指定
#iris$Species は "setosa", "versicolor", "virginica" の3種類からなり、Rでは自動的に異なる色（例：黒・赤・緑）を割り当て
pairs(iris[, 1:4], main = "Irisデータの散布図行列",col = iris$Species)