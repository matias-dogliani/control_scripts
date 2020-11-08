%Obtener la función de transferencia de un sistema de ecuaciones

pkg load symbolic 
pkg load control
clear 
clc 

A = [
-7 1
-10 0]; 
B =[
10
100] 
C =  [1 0]; 

syms S
I = eye(2); 
SI = S*I - A 
SInv = inv(SI) 
CSIB = C*SInv*B
FS= CSIB


%otra forma es sacar cofactores
%Hacer la transpuesta de esa y dividiarla por el determinante. Eso es la invertida
