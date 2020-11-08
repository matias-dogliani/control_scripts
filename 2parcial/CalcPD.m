%Cálculo de punto de Diseño 

function Pd = CalcPD(Wn,Zita)
sigma = Zita*Wn; 
Wd = sqrt(Wn^2 - sigma^2); 
Pd = complex(-sigma,Wd);
polyout(poly([complex(-sigma,Wd) complex(-sigma,-Wd);]),"S")
endfunction
