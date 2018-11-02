%Perceptrón 1

close all; clear all; clc;

%% Cargar datos
%load data2.txt; %Para los formatos txt
%data = data2;


data = xlsread('Datos_Proyecto2.xls','propuesta1_fs','a2:c313');
columns = size(data,2);
G0 = data(data(:,end)==0,1:end-1); %Devuelve los que cumplen que la condición, Grupo 0
G1 = data(data(:,end)==1,1:end-1); %Devuelve los que cumplen que la condición, Grupo 1

%plot(G0(:,1),G0(:,2),'bo', G1(:,1),G1(:,2), 'rx')

%Regresión Logística
X = normalize(data(:,1:end-1)); %Variablae independiente
Y = data(:,end); %Variable dependiente
m = size(X,1);
n=4; %grado del polinomio
Js = zeros(1,n); %Lista vacía que se llena con las Jopt 
%Xa = [ones(m,1) X];
for i=1:n
    Xa = func_polinomio(X,i);%Para un modelo de grado 

    W = zeros(size(Xa,2),1); %Depende de las columnas de Xa, es decir las variables
%%
    [J,dJdW] = fun_costo(W,Xa,Y);
    options = optimset('GradObj','on','MaxIter',1000);

    [Wopt, Jopt] = fminunc(@(W)fun_costo(W,Xa,Y),W,options);
    Js(1,i)=Jopt;
%Simulación del modelo
    V = Xa*Wopt; %Regreción Logística
    Yg = 1./(1+exp(-V));

    Yg = round(Yg);
%Yg=Yg<=.5
end
plot(Js)
TP = sum(Y==1&Yg==1);
TN = sum(Y==0&Yg==0);
FP = sum(Y==0&Yg==1);
FN = sum(Y==1&Yg==0);

Accuracy = (TP+TN)/(TP+TN+FP+FN);
Precition = (TP)/(TP+FP);
Recall = TP/(TP+FN);

[Accuracy Precition Recall]



