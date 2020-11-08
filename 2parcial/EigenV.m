%Autovector y Autovalores 
clear 
clc 

Matriz = [
0  1
-10 -7
]

[Autovalores, Autovectores] = eig(Matriz) %REVISAR ESTO 
[Autovalores] = eigs(Matriz) 
