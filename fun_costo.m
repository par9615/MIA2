%Función que calcula J y dJdW para la regresion logistica

function [J, dJdW] = fun_costo(W, Xa, Y)
    V=Xa*W;
    Yg=1./(1+exp(-V));
    m=size(Xa, 1);
    J=sum(-Y.*log(Yg)-(1-Y).*log(1-Yg))/m;
    E=Yg-Y;
    dJdW=(E'*Xa)'/m;
end