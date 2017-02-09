%Overlap Save Algorithm

clear all;
clc;
close all;

fs=100;
N=1024;
t=0:1/fs:N/fs-1/fs;

s=sin(2*pi*5*t)+sin(2*pi*20*t); %sygnal zrodlowy

Nb=32; %dlugosc segmentu sygnalu zrodlowego
fg=7; %czestotliwosc graniczna
M=13; %rzad filtra

filtr=fir1(M-1,2*fg/fs,boxcar(M)); %generowanie filtra
filtr2=[filtr zeros(1,Nb-M)];
FILTR2=fft(filtr2);

liniowy=conv(s, filtr); %splot bezposredni

%szybki splot - overlap save
L=32; %dlugosc segmentu
n=M-1; %dodawanie zer

L=ceil(log2(2*M));
L=2^L;
LS=floor((N-M+1)/(L-M+1)); %liczba segmentow
 
for i=0:LS-1
n1st=1+i*(L-(M-2)-1);
sn=s(n1st:n1st+L-1);
Sn=fft(sn);
Ys=FILTR2.*Sn;
sn=ifft(Ys);

y(n1st+M-1:n1st+M-1+(L-M))=sn(M:L);
end

figure(1)
subplot(2,1,1)
plot(abs(fftshift(fft(y))),'r'); %overlap save
title('Widmo amplitudowe');
xlabel('f[Hz]');
ylabel('amp');
hold on

plot(abs(fftshift(fft(liniowy(1:length(y)))))); %splot bezposredni
hold on;

plot(abs(fftshift(fft(s(1:length(y))))), 'k'); %widmo sygnalu zrodlowego
overlapsave=filtr2;

subplot(2,1,2)
plot(liniowy)
hold on;
plot(y, 'r')
title('Przebieg sygnalu');
xlabel('probki');
ylabel('amp');

