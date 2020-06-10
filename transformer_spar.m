% Computation of the S Parameters 
% for a 3 port model of a floating input 
% N to 1 ideal transformer. 
% Dick Benson, June 2018
clear 
clc
for N=[1 0.5 2 1/sqrt(2) sqrt(2) 1/3  3]
    N 
    s11 = N^2/(N^2+2);
    s22 = s11;
    s33 = (2/N^2 - 1)/(2/N^2 + 1);
    s21 = (1-s11);  % or 2/(N^2+2)
    s12 = s21;
    s13 = (1/N)*(1-s33);
    s31 =  s13;
    s23 = -s13;
    s32 =  s23;
      
    S=  [s11,s12,s13;
         s21,s22,s23;
         s31,s32,s33]
end;