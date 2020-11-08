%Comprobar la respusta a un escalón y a un impulso 
G = tf([3],[1 3]); 
A = 50;
t = (-1:0.01:1); 
delta = t==0;
impulso = A*delta;  
unitstep = t>=0;
u = A*unitstep;
figure('Name','Respuesta en el tiempo')
subplot(2,2,1),lsim(G,u,t),title("Respuesta a un escalón"); 
subplot(2,2,2),lsim(G,impulso,t), title("Respuesta a un impulso"); 
subplot(2,2,3),impulse(G), title("Respuesta a un impulso"); 
subplot(2,2,4),step(G),title("Respuesta a un impulso"); 