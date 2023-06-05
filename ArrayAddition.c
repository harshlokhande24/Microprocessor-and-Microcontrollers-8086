//Assignment 5 MM 
//Harshwardhan Lokhande

#include <PIC18F4550.h>
void main(void) {
    unsigned int arr[] = {15, 13, 12, 10};
    unsigned int a=0, i;
    TRISB = 0;
    LATB = 0;
    for (i=0; i<4; i++)
    {
        a+= arr[i];
    }
    PORTB = a;
}
