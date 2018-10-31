close all;
clear all;
clc;

data = xlsread('Datos_Proyecto2.xls', 1, 'A1:I313');

cr = corrcoef(data);