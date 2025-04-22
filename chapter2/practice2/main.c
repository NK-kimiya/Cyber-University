#include <stdio.h>
#include <stdlib.h>
#define N 100

//番人法：配列の末尾に探したい値(番人)を一時的に入れておくことで、ループ内の条件分岐を減らして処理を高速

//SentinelSearch という関数があることを前もって宣言
int SentinelSearch(int x[],int n,int y);
int main(void)
{
    //要素は8つ、配列サイズは9にしている
    //後に番人を追加するため
    int data[9] = {11,22,33,44,55,66,77,88};
    int target,rc;
    
    //目標データの入力
    printf("目標データを入力:");
    //ユーザーの入力を target に代入
    scanf("%d",&target);
    
    //SentinelSearch関数を呼び出し、結果を rc に代入
    rc = SentinelSearch(data,8,target);
    //戻り値が-1→見つからなかったと判断
    if(rc==-1) printf("見つかりません\n");
    // 見つかったときのインデックスを表示
    else printf("要素番号 %d のデータです\n",rc);
    
    return 0;
}

//配列
//n：配列の長さ
//y:探したい値
int SentinelSearch(int x[],int n,int y)
{
    int i=0;
    //末尾の番人用のスロット
    //探したい値を最後に追加
    x[n]=y; 
    //無限ループに見えるが、必ず見つかる(番人がいる)のでbreakを抜ける
    //通常の探索と違って、i < n のチェックが 不要
    while(1){
        if(x[i]==y) break;
        else i++;
    }
    //i < n → 本来のデータ部分（index 0～7）にあった → 見つかった
    if(i<n) return i;
    //i == n → 最後の番人に引っかかった → 実際にはデータに存在しなかった
    return -1;
}


