%Adaptive Sound Filtering - 2 speakers, FDAF - near end/far end signal
clc;
clear all;
close all;
load data.mat

%dA - mowca 1 (glos zenski)
%dB - mowca 2 (glos meski)

M=50; %rzad filtra

ha=zeros(1,M);
hb=zeros(1,M);
bufor_b=zeros(1,M);
bufor_a=zeros(1,M);

y_a=zeros(1,length(s));
y_b=zeros(1,length(s));

e_a=zeros(1,length(s));
e_b=zeros(1,length(s));

%parametry filtracji
mi=0.3;
mi2=0.1;
gamma=0.9;

c=[];
for i=1:length(s)
   
    bufor_b = [dA(i) bufor_b(1:M-1)];
    y_a(i) = hb*bufor_b'; %glos zenski
    e_a(i) = dB(i) - y_a(i); %blad - glos meski
    
    
    a=mi/((gamma)+bufor_b*bufor_b');
    %hb= hb+2*mi*e_a(i)*bufor_b; %lms
    hb= hb+2*a*e_a(i)*bufor_b; %nlms
    
    bufor_a = [dB(i) bufor_a(1:M-1)];
    y_b(i) = ha*bufor_a'; %glos meski
    e_b(i) = dA(i) - y_b(i); %blad - glos zenski
    
    a1=mi2/((gamma)+bufor_a*bufor_a');
    %ha= ha+2*mi2*e_b(i)*bufor_a; %lms
    ha= ha+2*a1*e_b(i)*bufor_a; %nlms  
 
    c=[c a1];
    
end

%odtwarzanie przefiltrowanych nagran
%sound(e_a, fs)
%sound(e_b, fs)
