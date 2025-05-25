//基本挿入法
#include <stdio.h>
#define N 8  // データ数

void ShellSort(int x[],int n);

int main(void)
{
    int data[N]={3,2,8,5,7,1,6,4};
    int i;

    printf("\n並べ替え前\n");
    for(i=0;i<N;i++) printf("%d\t",data[i]);
    printf("\n");

    ShellSort(data,N);

    printf("\n並べ替え後\n");
    for(i=0;i<N;i++) printf("%d\t",data[i]);
    printf("\n");

    return 0;
}

void ShellSort(int x[],int n)
{
   int i,j,k,tmp,gap;
 
   gap=n/2;
   while(gap>0){
      for(k=0;k<gap;k++){
         for(j=k+gap;j<n;j=j+gap){
            tmp=x[j];
            for(i=j-gap;i>=0;i=i-gap){
               if(x[i]>tmp) x[i+gap]=x[i];
               else break;
            }
            x[i+gap]=tmp;
         }
      }
      gap=gap/2;
   }
   return;
}