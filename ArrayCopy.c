//Assignment 6 MM 
//Harshwardhan Lokhande

#include <PIC18F4550.h> 
#include <stdio.h>
int main() {
    int arr1[] = {1, 2, 3, 4, 5};
    int arr2[20];
    for (int i=0; i<5; i++)
    { 
        arr2[i] = arr1[i];
    }
    return 0; 
}


#include <PIC18F4550.h>
#include <stdio.h>
int main() {
    int arr1[] = {1, 2, 3, 4, 5}; 
    int arr2[] = {10, 9, 8, 7, 6}; int temp;
    for (int i=0; i<5; i++)
    {
        temp = arr2[i];
        arr2[i] = arr1[i];
        arr1[i] = temp;
        temp = 0;
    }
    return 0;
}
 
 
