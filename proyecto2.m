close all;
clear all;
clc;

data = xlsread('Datos_Proyecto2.xls', 1, 'A1:J313');
nf = size(data,2)-1; %numero de features

for k=1:2^nf-1  %Itera sobre todos los posibles subconjuntos excepto el vacio
    indexes = logical(de2bi(k, nf))
    nfk = sum(indexes)                     %numero de variables en en el subconjunto
    datasub = [data(:,indexes) data(:,nf+1)] %subconjunto de features
    cr = corrcoef(datasub)                  %tabla de correlaciones
    
    rcf = sum(cr(1:nfk,nfk+1)) %correlacion feature-clasificacion
    rff = 0;                     %correlacion feature-feature
    
    for i=1:nfk
       for j=i+1:nfk
              rff=rff+cr(i,j);
       end
    end

    cfs(k)=rcf/sqrt(nfk+2*rff);
end





