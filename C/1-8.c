//
//  main.c
//  bitch
//
//  Created by Confident on 5/2/13.
//  Copyright (c) 2013 Confident. All rights reserved.
//  Building an iphone app

#include <stdio.h>

void singthesong(int n)
{
    if (n ==0){
        printf("wtf");
    } else {
        printf("%d bottles of fuck you %d beers", n, n);
        int fewer = n - 1;
        printf("take one down, pass it around , %d beer", fewer);
        singthesong(fewer);
    }
}

float fahtocel(float cel)
{
    float fahr = cel * 1.8 + 32.0;
    printf("%f cel is %f fahrenheit\n", cel, fahr);
    return fahr;
}

float average(float a, float b)
{
    return (a + b)/2.0;
    printf("the mean justifies the ");
}

float remainingAngle(float a, float b)
{
    int remain = 180 - a - b;
    return remain;
}



int main(int argc, const char * argv[])
{
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB);
    int  i = 17;
    float *pos = &angleA;
    printf("the third angle is %.2f\n", angleC);
    printf("I stored at %p", &angleA);
    printf("I stored at %p", &angleB);
    printf("I stored at %p", pos);
    printf("i is %zu", sizeof(float *));
    return 0;
}
