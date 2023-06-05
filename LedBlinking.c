//Assignment 7 MM
//Harshwardhan Lokhande 

#include<PIC18F4550.h>
void delay(){
    int i,j;
    for(i=0;i<100;i++);
    for(j=0;j<100;j++);
}

void main(){
    TRISC = 0x00;
    while(1){
        PORTC = 0x01;
        delay();
        PORTC = 0x00;
        delay();
    }
}
