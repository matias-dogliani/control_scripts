clear
clc 
pkg load control
pkg load signal
warning("off"); 

%---------Definicion de funcion ------
Num = [4 25]; 
Den = [1 4 0]; 
G =  tf(Num,Den); 
%------------------------------------

%Para escalon
[Ceros,Polos,K] = zpkdata(G);
 Knum = 1;
 
[num, den, tsam] = tfdata(G);
Ceros = roots(cell2mat(num));
Polos = roots(cell2mat(den)); 


 if(length(Ceros)>0)
  for i = 1:(length(Ceros))
     Knum *= (abs(Ceros(i)));
  endfor
endif
Knum = K*Knum; 
 
Kden = 1;
 for i = 1:(length(Polos))
    Kden *=  abs(Polos(i));
 endfor

 printf("Error de posicion Kp: \n");
 
Knum
Kden
Kp = Knum/Kden
ess = 1 / (1 + Kp)


%Para rampa
 D = tf([1 0],[1]); % S
 G  = series(G,D);
[Ceros,Polos,K] = zpkdata(G);
 Knum = 1;
 
[num, den, tsam] = tfdata(G);
Ceros = roots(cell2mat(num));
Polos = roots(cell2mat(den)); 


 if(length(Ceros)>0)
  for i = 1:(length(Ceros))
     Knum *= (abs(Ceros(i)));
  endfor
endif
Knum = K*Knum; 
 
Kden = 1;
 for i = 1:(length(Polos))
    Kden *=  abs(Polos(i));
 endfor
 printf("Error de velocidad Kv: \n")
Knum
Kden
Kv = Knum/Kden
ess = 1 / (Kv)


%Para parabola
 D = tf([1 0 0], [1]); % S^2
 G  = series(G,D);
[Ceros,Polos,K] = zpkdata(G);
 Knum = 1;
 
[num, den, tsam] = tfdata(G);
Ceros = roots(cell2mat(num));
Polos = roots(cell2mat(den)); 


 if(length(Ceros)>0)
  for i = 1:(length(Ceros))
     Knum *= (abs(Ceros(i)));
  endfor
endif
Knum = K*Knum; 
 
Kden = 1;
 for i = 1:(length(Polos))
    Kden *=  abs(Polos(i));
 endfor
 printf("Error de aceleracion Ka: \n")
Knum
Kden
Ka = Knum/Kden
ess = 1 / ( Ka)


