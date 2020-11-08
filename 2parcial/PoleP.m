%OBtener la ecuación para encontar K (Pole Placement) 
clear
clc
pkg load symbolic 

syms S
syms k1 
syms k2  

SI = [
S 0 
0 S
]; 

A =[
0 1 
-10 -7]; 

B = [
 0   
 1];  

K = [k1 k2];
 
 

Ec = det (SI - (A- B*K)) 

 
 %Ackearman 
 %[0 1]*inv(Co)*(A^2 + 8*A +32*eye(2))
 
 