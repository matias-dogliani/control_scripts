%obtener Autovalores por definición 
clear
clc
pkg load symbolic 

syms X 

SI = X*eye(3); 

A = [
0 1 0
0 0 1
0 0 -6]; 

SI - A 
Ec = det (SI - A ) 

solve(Ec) 