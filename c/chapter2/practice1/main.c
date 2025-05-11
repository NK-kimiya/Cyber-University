#include <stdio.h>
#include <stdlib.h>
#define N 100

//線形探索：配列内に目標の値が存在するかどうか

//プロトタイプ宣言「このあとLinearSearch関数が定義されるという宣言」
int LinearSearch(int x[],int n,int y);
int main(void)
{
    //長さ8の整数配列の定義、初期値を設定
    int data[8] = {11,22,33,44,55,66,77,88};
    int target,rc;
    
    //目標データの入力
    printf("目標データを入力:");
    //ユーザーの入力を target に代入
    scanf("%d",&target);
    
    //LinearSearch 関数を呼び出し、結果を rc に代入
    rc = LinearSearch(data,8,target);
    //戻り値が-1→見つからなかったと判断
    if(rc==-1) printf("見つかりません\n");
    // 見つかったときのインデックスを表示
    else printf("要素番号 %d のデータです\n",rc);
    
    return 0;
}

//配列
//n：配列の長さ
//y:探したい値
int LinearSearch(int x[],int n,int y)
{
    //配列xを最初から順に調べる
    //見つかった時点で i（インデックス）を返す。
    //最後まで見つからなければ -1 を返す。
    int i=0;
    while(i<n){
        if(x[i]==y) return i;// 見つかったらそのインデックスを返す
        else i++;// 次の要素をチェック
    }
    return -1;
}

