%Hilbert Transform

clear all;
clc;
close all;

fs=1024;
N=1024;
t=-(N/(2*fs)-1/fs):1/fs:N/(2*fs);

s=sinc(2*pi*5*t); %sygnal zrodlowy

a=2*pi*5*4;
z=(1-cos(t*a))./(t*a);

%Algorytm dyskretnej transformacji Hilberta - w oparciu o DFT
widmo=fft(s);

fftx=zeros(1,N);
for i=1:1:N
    
    if i<N/2+1
    fftx(i)=i-1;
    else fftx(i)=-1*(N+1-i);
    end
end

sgn=sign(fftx);

hil=-1i*sgn.*widmo; 
hilb=ifft(hil); 


figure(1)
plot(real(hilb)) %transformacja Hilberta
hold on;
plot(z, 'ro') %dla porownania (teoretyczna TH sygnalu zrodlowego)
title('Transformacja Hilberta');
xlabel('f[Hz]');
ylabel('amp');




