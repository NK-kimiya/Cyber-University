#include <stdio.h>
//定数Nに8を代入
#define N 8  // データ数

/*全体の流れ
・data[N] = {11,22,33,44,55,66,77,88} ← 昇順に並んだ配列
・ユーザーに数値を入力してもらう（目標値）
・線形探索と二分探索で探し、結果を表示
・線形探索と二分探索で目標値を探すのに、それぞれ何個の要素を調べたかを表示
*/
int LinearSearch(int x[],int n,int y);
int BinarySearch(int x[],int n,int y);

int COUNT;//カウント用のグローバル変数
 
int main(void)
{
    //8個の要素を持つ配列を定義
    int data[N]={11,22,33,44,55,66,77,88};
    int target,rc;
 	
    //探したい数字をキーボドから入力
    printf("目標データを入力：");
    scanf("%d",&target);
 
    printf("\n線形探索\n");
    //線形探索を実行して、結果（要素番号 or -1）を受け取る
    rc = LinearSearch(data,N,target);
    if(rc==-1) printf("見つかりません\n");
    else printf("要素番号 %d のデータです\n",rc);
    printf("%d個の要素について調べました\n",COUNT);
 	
    COUNT=0;
    printf("\n二分探索\n");
    //二分探索を実行して、同様に結果を受け取る
    rc = BinarySearch(data,N,target);
    if(rc==-1) printf("見つかりません\n");
    else printf("要素番号 %d のデータです\n",rc);
 	printf("%d個の要素について調べました\n",COUNT);
    
    return 0;
}

//配列 x[] に y があるか、左から1つずつ順番に調べる
int LinearSearch(int x[],int n,int y)
{
    int i=0;
    while(i<n){
        COUNT++;
        if(x[i]==y) return i;// 見つかったらその位置を返す
        else i++;
    }
    return -1;// 見つからなかった場合
}

//整列済み配列に対して、高速に目的の値を探す方法
int BinarySearch(int x[],int n,int y)
{
    int min,mid,max;
    
    //真ん中の値と比較し、範囲を絞っていく
    min=0;
    max=n-1;
    while(min<=max){
        mid=(min+max)/2;
        COUNT++;
        if(x[mid]<y) min=mid+1;// 右側へ
        else if(x[mid]>y) max=mid-1;// 左側へ
        else return mid; // 見つかった
    }
    return -1;// 最後まで見つからなかった
}

