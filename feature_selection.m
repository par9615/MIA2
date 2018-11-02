close all;
clear all;
clc;

data = xlsread('Datos_Proyecto2.xls', 1, 'A1:J313');
data(:,1:9) = normalize(data(:,1:9));
nf = size(data,2)-1; %numero de features

meancr=mean(corrcoef(data), 2);  %promedio de correlaciones entre de cada variable

for k=1:2^nf-1  %Itera sobre todos los posibles subconjuntos excepto el vacio
    indexes = logical(de2bi(k, nf));        
    nfk = sum(indexes);                     %numero de variables en en el subconjunto
    datasub = [data(:,indexes) data(:,nf+1)]; %subconjunto de features
    cr = corrcoef(datasub);                  %tabla de correlaciones
    
    rcf = sum(cr(1:nfk,nfk+1)); %correlacion feature-clasificacion
    rff = 0;                     %correlacion feature-feature
    
    for i=1:nfk
       for j=i+1:nfk
              rff=rff+cr(i,j);
       end
    end

    cfs(k,:)=[rcf/sqrt(nfk+2*rff) nfk k];
end

%CFS maximo por numero de features

    maxi=-9999;
    for j=1:2^nf-1
        if cfs(j,2)==6
            if cfs(j,1)>maxi
               maxi = cfs(j,1);
               row = cfs(j,:);
            end
        end
    end    

row
de2bi(row(3))


% %CFS promedio por numero de features
% for i=1:nf
%     meani(i)=0;
%     count=0;
%     for j=1:2^nf-1
%         if cfs(j,2)==i            
%             meani(i) = meani(i)+cfs(j,1);
%             count=count+1;
%         end
%     end    
%     meani(i) = meani(i)/count;
% end
% 
% %plot(meani);

%[val, index]=max(cfs(:,1));
%features=find(de2bi(index,nf));





