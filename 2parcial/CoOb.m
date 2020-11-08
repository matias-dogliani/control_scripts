%Determinar contrabilidad y observabilidad de un sistema 

pkg load control 



C =  [1 1 0]; 

Co = [B A*B A*A*B] 

if(det(Co)) %Ademas habria que comprobar si EL RANGO ES IGUAL AL ORDEN DEL SISTENA
printf("Es controlable \n"); 
endif 


Ob = [C 
C*A]


%Ob'
if(det(Ob))
printf("Es observable \n"); 
endif 

Ob = obsv(A,C) 
Co = ctrb(A,B) 