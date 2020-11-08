


function [Kp,Kv,Ka] = Ess (G)

warning("off"); 

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


Kp = Knum/Kden;
ess = 1 / (1 + Kp);


%Para rampa

knumKv =1; 
 if(length(Ceros)>0)
   for i = 1:(length(Ceros))
     knumKv*= (abs(Ceros(i)));
  endfor
endif
knumKv= K*knumKv;
 
Kden = 1;
contador =0; 
 for i = 1:(length(Polos))
    if  (!(abs(Polos(i))) && contador <1)  %Solo me cancela un polo el cero agregado
      contador += 1;
   else 
     Kden *=  abs(Polos(i));
   endif
 endfor
Kv = knumKv/Kden;
essKv = 1 / (Kv);


%Para parabola
knumKa = 1; 
 if(length(Ceros)>0)
  for i = 1:(length(Ceros))
     knumKa *= (abs(Ceros(i)));
  endfor
endif
knumKa= K*knumKa; 
 
Kden = 1;
contador =0; 
 for i = 1:(length(Polos))
    if  (!(abs(Polos(i))) && contador <2) 
      contador += 1; 
   else 
     Kden *=  abs(Polos(i));
   endif
 endfor

Ka = knumKa/Kden;
essKa = 1 / (Ka);

endfunction