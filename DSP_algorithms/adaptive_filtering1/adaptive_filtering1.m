%Adaptive filter LMS/NLMS

clear all;
clc;
close all;
load data.mat

% x, n, s - sygnaly referencyjne
% x - sygnal zrodlowy s+n (signal+noise)
% n - sygnal w tle (noise)

M=10; %rzad filtra
h=zeros(1,M);
bufor=zeros(1,M);
d=[];
y=[];

%parametry filtra
mi=0.001;
gamma=0.01;
f=f/1000;

for i=1:length(x)
   
    bufor = [n(i) bufor(1:M-1)];
    
    d = h*bufor';
    
    error = x(i) - d;
   a=mi/((gamma)+bufor*bufor');
   
    %h= h+2*mi*f(i)*error*bufor; %filtracja lms
    h= h+2*a*error*bufor; % filtracja nlms
    
    y(i)=d;
    e(i)=error;
    wektora(i)=a;
 
end

figure(1)
subplot(2,3,1)
spectrogram(x,1024,256,1024,fs,'yaxis')
title('sygnal wejsciowy')

subplot(2,3,2)
spectrogram(n,1024,256,1024,fs,'yaxis')
title('sygnal zaklocaj¹cy')

subplot(2,3,3)
spectrogram(y,1024,256,1024,fs,'yaxis')
title('sygnal wyjsciowy')

subplot(2,3,4)
spectrogram(e,1024,256,1024,fs,'yaxis')
title('sygnal b³edu')

subplot(2,3,5)
spectrogram(s,1024,256,1024,fs,'yaxis')
title('sygnal czysty')
