#ifndef CONSTANTS
#define CONSTANTS
    
    //Known math constants 
    static const half pI = 3.14;
    static const half DEG_TO_RAD = 0.02;
    static const half EPSILON_RGB2HSV = 1.0e-10;
    
    //Typical floats 
    static const half ZERO = 0;
    static const half POINT25 = .25;
    static const half POINT5 = .5;
    static const half POINT75 = .75;
    static const half ONE = 1;
    static const half ONE_AND_HALF = 1.5;
    static const half TWO = 2;
    static const half THREE = 3;
    static const half FOUR = 4;
    static const half FIVE = 5;
    static const half SIX = 6;
    static const half SEVEN = 7;
    static const half EIGHT = 8;
    static const half NINE = 9;
    static const half TEN = 10;
    static const half FORTY_5 = 45;
    static const half NINEGHTY = 90;
    static const half HUNDRED_80 = 180;
    static const half TWO_HUNDRED_70 = 270;
    static const half THREE_HUNDRED_60 = 360;
    
    //Typical colors
    static const half3 WHITE = half3(1,1,1);
    static const half3 BLACK = half3(0,0,0);
    static const half3 RED = half3(1,0,0);
    static const half3 GREEN = half3(0,1,0);
    static const half3 BLUE = half3(0,0,1);
    
    //Typical math masks
    static const half3 SATURATION_MASK = half3(0.30,0.59,0.11);
    
    //Matrices
    static const half4x4 ETALON_TRS_LP;
    
#endif