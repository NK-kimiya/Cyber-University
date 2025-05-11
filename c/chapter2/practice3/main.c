#include <stdio.h>
#include <stdlib.h>

//struct personという構造体に、以下の2つの要素を定義
//・int id:会員番号
//・char name[20]：名前(文字列)
//typedef によって、以降は Person という名前でこの構造体を扱える
typedef struct person{
    int id;
    char name[20];
}Person;

int LinearSearch_id(Person x[],int n,int y);
int LinearSearch_name(Person x[],int n,char y[]);

int main(void)
{
    //8人の人物データをdata配列に格納
    Person data[8] = {{101,"Ann"},{202,"Bob"},
                      {303,"Carol"},{404,"Jack"},{505,"Karen"},
                      {606,"Lucy"},{707,"Maria"},{808,"Ted"}};
    
    int target_id;
    char target_name[20];
    int rc;
    
    //1：会員番号を入力
    //2：LinearSearch_id() で探索
    //3：見つかったらIDと名前を表示／なければ「見つかりません」
    printf("\n会員番号を入力:");
    scanf("%d",&target_id);
    rc = LinearSearch_id(data,8,target_id);
    if(rc==-1) printf("見つかりません\n");
    else printf("会員番号：%d 名前：%s\n",data[rc].id,data[rc].name);
    
    //１：名前を入力
    //２：LinearSearch_name() で探索
    //３：同様に結果を表示
    printf("\n名前を入力：");
    scanf("%s",target_name);
    rc=LinearSearch_name(data,8,target_name);
    if(rc==-1) printf("見つかりません\n");
    else printf("会員番号:%d 名前:%s\n",(data+rc)->id,(data+rc)->name);
    
    return 0;
}

//idで人物を検索する関数
//該当するidが見つかれば、そのインデックスを返す
//見つからなけらば-1
int LinearSearch_id(Person x[],int n,int y)
{
    int i=0;
    while(i<n){
        if(x[i].id==y) return i;
        else i++;
    }
    return -1;
}

//名前で人物を検索する関数
//strcmp() 関数を使って、2つの文字列が等しいか比較
//等しいときは 0 を返す → == 0 で一致判定
//配列名は「配列の先頭アドレス」を表す　→　name は「name[0] のアドレス」
//→　中身を変更したり代入することは可能
//→　配列名そのものを比較・代入しようとするとメモリ上の場所が同じかどうか」を比較してしまう
//→　中身を正しく比較したいなら strcmp()
int LinearSearch_name(Person x[],int n,char y[])
{
    int i=0;
    while(i<n){
        if(strcmp(x[i].name,y)==0) return i;
        else i++;
    }
    return -1;
}

//アドレス値を指定すると、値の参照と変更をすることができる、関数でもアドレスを指定するから変更ができる。
//→「0x7ffee4a3f2bc」とかいうアドレスを毎回覚えたり、書いたりするのは現実的ではない
//→そこで「アドレスを覚える変数」ポインタを使用：ポインタ自身のアドレスもできる。

