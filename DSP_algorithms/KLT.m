%Karhunen-Loeve Transform

clear all;
clc;
close all;

N=100;
lp=1000; %liczba próbek
t=linspace(0,1,lp);

temp=[];

for i=1:1:N
    s(:,i)=randn(lp,1);
    s(:,i)=s(:,i)+sin(2*pi*t*i*7)';
end

srednie=mean(s,2);

%macierz autokorelacji
for i=1:1:N
    
    temp(:,:,i)=s(:,i)*(s(:,i)');
    
end
autokorelacja=mean(temp,3);

%macierz kowariancji
kowariancja=autokorelacja - srednie*(srednie');

%wektory wlasne macierzy kowariancji
[V, D] = eig(kowariancja);

V=V';
klt=V*s;

%klt(1:900,:,:)=0; 
%V=V/(max(max(V))); %normalizacja

invklt=inv(V)*klt; %transformacja odwrotna

figure (1)
imagesc(s) %sygnal zrodlowy

figure (2)
imagesc(klt) %transformacja KLT

figure(3)
imagesc(s-invklt) %blad


