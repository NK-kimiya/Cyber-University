//基本挿入法
#include <stdio.h>
#define N 8  // データ数

void InsertionSort(int x[],int n);

int main(void)
{
    int data[N]={3,2,8,5,7,1,6,4};
    int i;

    printf("\n並べ替え前\n");
    for(i=0;i<N;i++) printf("%d\t",data[i]);
    printf("\n");

    InsertionSort(data,N);

    printf("\n並べ替え後\n");
    for(i=0;i<N;i++) printf("%d\t",data[i]);
    printf("\n");

    return 0;
}

void InsertionSort(int x[],int n)
{
    int i,j,tmp;

    for(j=1;j<n;j++){
        tmp=x[j];
        for(i=j-1;i>=0;i--){
            if(x[i]>tmp) x[i+1]=x[i];
            else break;
        }
        x[i+1]=tmp;
    }
    return;
}