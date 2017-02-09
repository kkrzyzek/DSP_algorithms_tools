%Envelope Decoding - Hilbert Transform

clc;
clear all;
close all;
load('data.mat');

figure(1)
plot(s_01)
title('Sygnal zrodlowy');
xlabel('probki');
ylabel('amp');

fg=0.5; %czestotliwosc graniczna
M=8; %rzad filtra

[b,a]=butter(M,2*fg/fs,'low');
N=N+1000;

fftx=zeros(1,N);
for i=1:1:N
    
    if i<N/2+1
    fftx(i)=i-1;
    else fftx(i)=-1*(N+1-i);
    end
end

s_01=[s_01 zeros(1,1000)];

%fftx=fftshift(fftx);
sgn=sign(fftx);

%transformacja Hilberta
widmo=fft(s_01);
hil=-1i*sgn.*widmo;
hilb=ifft(hil);

figure(2) 
plot(real(hilb(1:2500))) %odtworzony sygnal z transformaty
hold on;
amp=abs(s_01+(1i*hilb)); %obwiednia sygnalu
plot(amp(1:2500), 'r')
title('Transformacja Hilberta i obwiednia sygnalu');
xlabel('probki');
ylabel('amp');

amp_2=filter(b,a,amp); %filtracja (butterworth)

figure (3)
plot(amp_2(1:2500))
hold on

plot(obwiednia,'r') %obwiednia

%amp_med=medfilt1(amp(1:2500),90); %filtr medianowy (do s_03)
%plot(amp_med,'k') %obwiednia po filtracji medianowej (do s_03)
title('Porownanie obwiedni sygnalu - zdekodowanej z referencyjna');
xlabel('probki');
ylabel('amp');
