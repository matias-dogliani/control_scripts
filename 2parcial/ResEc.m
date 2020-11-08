pkg load symbolic 
pkg load control
clear 
clc 

A = [
-2 0
0 -5]; %MATRIZ YA DIAGONALIZADA 
B =[
10/3
-10/3] 
C =  [1 0]; 
CI = [
1
1];

syms S
I = eye(2); 
Temp = S*I - A; 
Temp = inv(Temp); 
Temp = ilaplace(Temp);

Homogenea = Temp* CI