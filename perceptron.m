%Perceptrón 1

close all; clear all; clc;

%% Propuesta 1
data_1 = xlsread('Datos_Proyecto2.xlsx','prop1','a2:c313');

%Regresión Logística
X_1 = normalize(data_1(:,1:end-1)); %Variablae independiente
Y_1 = data_1(:,end); %Variable dependiente
n_1=6; %grado del polinomio
Js_1 = zeros(1,n_1); %Lista vacía que se llena con las Jopt 
for i=1:n_1
    Xa_1 = func_polinomio(X_1,i);%Para un modelo de grado 

    W_1 = zeros(size(Xa_1,2),1); %Depende de las columnas de Xa, es decir las variables
    [J_1,dJdW_1] = fun_costo(W_1,Xa_1,Y_1);
    options = optimset('GradObj','on','MaxIter',1000);

    [Wopt_1, Jopt_1] = fminunc(@(W_1)fun_costo(W_1,Xa_1,Y_1),W_1,options);
    Js_1(1,i)=Jopt_1;
    V_1 = Xa_1*Wopt_1; %Regresión Logística
    Yg_1 = 1./(1+exp(-V_1));

    Yg_1 = round(Yg_1);
end
plot(Js_1);

%Simulación del modelo
first_proposal_grade = 4;
Xa_1 = func_polinomio(X_1,first_proposal_grade);
W_1 = zeros(size(Xa_1,2),1);
[Wopt_1, Jopt_1] = fminunc(@(W_1)fun_costo(W_1,Xa_1,Y_1),W_1,options);
V_1 = Xa_1*Wopt_1; 
Yg_1 = 1./(1+exp(-V_1));

Yg_1 = round(Yg_1);

TP_1 = sum(Y_1==1&Yg_1==1);
TN_1 = sum(Y_1==0&Yg_1==0);
FP_1 = sum(Y_1==0&Yg_1==1);
FN_1 = sum(Y_1==1&Yg_1==0);

Accuracy_1 = (TP_1+TN_1)/(TP_1+TN_1+FP_1+FN_1);
Precition_1 = (TP_1)/(TP_1+FP_1);
Recall_1 = TP_1/(TP_1+FN_1);

disp('Primer propuesta:');
disp(['Accuracy = ' num2str(Accuracy_1) ', Precition = ' num2str(Precition_1) ', Recall = ' num2str(Recall_1)])

% Clasificación de datos
clasify_data_1 = xlsread('Datos_Proyecto2.xlsx', 'cl_prop1', 'a2:b5');

X_1 = normalize(clasify_data_1);
Xa_1 = func_polinomio(X_1, first_proposal_grade);
W_1 = zeros(size(Xa_1, 2), 1);
V_1 = Xa_1*Wopt_1; %Regresión Logística
Yg_1 = round(1./(1+exp(-V_1)));

disp('Clasificación 1: ')
disp(Yg_1)

%% Propuesta 2
data_2 = xlsread('Datos_Proyecto2.xlsx','prop2','a2:f313');

%Regresión Logística
X_2 = normalize(data_2(:,1:end-1)); %Variablae independiente
Y_2 = data_2(:,end); %Variable dependiente
n_2=6; %grado del polinomio
Js_2 = zeros(1,n_2); %Lista vacía que se llena con las Jopt 
for i=1:n_2
    Xa_2 = func_polinomio(X_2,i);%Para un modelo de grado 

    W_2 = zeros(size(Xa_2,2),1); %Depende de las columnas de Xa, es decir las variables
    [J_2,dJdW_2] = fun_costo(W_2,Xa_2,Y_2);
    options = optimset('GradObj','on','MaxIter',1000);

    [Wopt_2, Jopt_2] = fminunc(@(W_2)fun_costo(W_2,Xa_2,Y_2),W_2,options);
    Js_2(1,i)=Jopt_2;
    V_2 = Xa_2*Wopt_2; %Regresión Logística
    Yg_2 = 1./(1+exp(-V_2));

    Yg_2 = round(Yg_2);
end
plot(Js_2);

%Simulación del modelo
second_proposal_grade = 3;
Xa_2 = func_polinomio(X_2,second_proposal_grade);
W_2 = zeros(size(Xa_2,2),1);
[Wopt_2, Jopt_2] = fminunc(@(W_2)fun_costo(W_2,Xa_2,Y_2),W_2,options);
V_2 = Xa_2*Wopt_2; 
Yg_2 = 1./(1+exp(-V_2));

Yg_2 = round(Yg_2);

TP_2 = sum(Y_2==1&Yg_2==1);
TN_2 = sum(Y_2==0&Yg_2==0);
FP_2 = sum(Y_2==0&Yg_2==1);
FN_2 = sum(Y_2==1&Yg_2==0);

Accuracy_2 = (TP_2+TN_2)/(TP_2+TN_2+FP_2+FN_2);
Precition_2 = (TP_2)/(TP_2+FP_2);
Recall_2 = TP_2/(TP_2+FN_2);

disp('Segunda propuesta:');
disp(['Accuracy = ' num2str(Accuracy_2) ', Precition = ' num2str(Precition_2) ', Recall = ' num2str(Recall_2)])

% Clasificación de datos
clasify_data_2 = xlsread('Datos_Proyecto2.xlsx', 'cl_prop2', 'a2:e5');

X_2 = normalize(clasify_data_2);
Xa_2 = func_polinomio(X_2, first_proposal_grade);
W_2 = zeros(size(Xa_2, 2), 1);
V_2 = Xa_2*Wopt_2; %Regresión Logística
Yg_2 = round(1./(1+exp(-V_2)));

disp('Clasificación 2: ')
disp(Yg_2)

%% Propuesta 3
%data_3 = xlsread('Datos_Proyecto2.xlsx','prop3','a2:p313');

%Regresión Logística
%X_3 = normalize(data_3(:,1:end-1)); %Variablae independiente
%Y_3 = data_3(:,end); %Variable dependiente
%n_3=6; %grado del polinomio
%Js_3 = zeros(1,n_3); %Lista vacía que se llena con las Jopt 
%for i=1:n_3
    %Xa_3 = func_polinomio(X_3,i);%Para un modelo de grado 

    %W_3 = zeros(size(Xa_3,2),1); %Depende de las columnas de Xa, es decir las variables
    %[J_3,dJdW_3] = fun_costo(W_3,Xa_3,Y_3);
    %options = optimset('GradObj','on','MaxIter',1000);

    %[Wopt_3, Jopt_3] = fminunc(@(W_3)fun_costo(W_3,Xa_3,Y_3),W_3,options);
    %Js_3(1,i)=Jopt_3;
    %V_3 = Xa_3*Wopt_3; %Regresión Logística
    %Yg_3 = 1./(1+exp(-V_3));

    %Yg_3 = round(Yg_3);
%end
%plot(Js_3);

%Simulación del modelo
%third_proposal_grade  = 4;
%Xa_3 = func_polinomio(X_3,third_proposal_grade);
%W_3 = zeros(size(Xa_3,2),1);
%[Wopt_3, Jopt_3] = fminunc(@(W_3)fun_costo(W_3,Xa_3,Y_3),W_3,options);
%V_3 = Xa_3*Wopt_3; 
%Yg_3 = 1./(1+exp(-V_3));

%Yg_3 = round(Yg_3);

%TP_3 = sum(Y_3==1&Yg_3==1);
%TN_3 = sum(Y_3==0&Yg_3==0);
%FP_3 = sum(Y_3==0&Yg_3==1);
%FN_3 = sum(Y_3==1&Yg_3==0);

%Accuracy_3 = (TP_3+TN_3)/(TP_3+TN_3+FP_3+FN_3);
%Precition_3 = (TP_3)/(TP_3+FP_3);
%Recall_3 = TP_3/(TP_3+FN_3);

%disp('Tercer propuesta:');
%disp(['Accuracy = ' num2str(Accuracy_3) ', Precition = ' num2str(Precition_3) ', Recall = ' num2str(Recall_3)])

% Clasificación de datos
%clasify_data_3 = xlsread('Datos_Proyecto2.xlsx', 'cl_prop2', 'a2:e5');

%X_3 = normalize(clasify_data_3);
%Xa_3 = func_polinomio(X_3, first_proposal_grade);
%W_3 = zeros(size(Xa_3, 2), 1);
%V_3 = Xa_3*Wopt_3; %Regresión Logística
%Yg_3 = round(1./(1+exp(-V_3)));

%disp('Clasificación 3: ')
%disp(Yg_3)