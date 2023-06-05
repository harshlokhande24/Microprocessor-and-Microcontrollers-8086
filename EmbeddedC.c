//Assignment 4 MM 
//Harshwardhan Lokhande

#include<PIC18F4550.h>
void main(){
    unsigned int a=5,b=6,c=0;
    TRISB=0;
    LATB=0;
    c=a+b;
    PORTB= c;
    PORTC= a;
    PORTD= b;
}
