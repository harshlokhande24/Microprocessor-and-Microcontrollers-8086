//Assignment 8 MM
//Harshwardhan Lokhande 

#include<stdio.h> 
#include<PIC18F4550.h>

void main(){ 
    unsigned int arr[5]={7,5,8,3,6}; 
    unsigned int a[5]={5,8,9,2,1}; 
      
    for(int i=0;i<5;i++)
    { 
        for(int j=0;j<5-i-1;j++)
        { 
            if(arr[j]<arr[j+1])
            { 
                int temp=arr[j]; 
                arr[j]=arr[j+1]; 
                arr[j+1]=temp; 
            } 
        } 
    } 
      
    for(int i=0;i<5;i++)
    { 
        for(int j=0;j<5-i-1;j++)
        { 
            if(a[j]>a[j+1])
            { 
                int temp=a[j]; 
                a[j]=a[j+1]; 
                a[j+1]=temp; 
            } 
        } 
    } 
}
