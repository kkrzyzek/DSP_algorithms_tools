%Signal generation + FFT
clear all;
clc;
close all;

fs=10000; %czestotliwosc probkowania
t=-1:1/fs:1; %czas
y=rectpuls(t); %generowanie sygnalu

subplot(3,1,1)
plot(t,y,'r');
title('Sygnal prostokatny - rectpuls');
xlabel('t');
ylabel('amp');

l=length(y);
y2=ones();
i=1;

for n=1:10:l
y2(i)=y(n);
i=i+1;
end

fs2=1000;
t2=-1:1/fs2:1;

subplot(3,1,2)
plot(t2,y2);
title('Sygnal prostokatny');
xlabel('t');
ylabel('amp');

spec=fft(y2);
m=abs(spec);

f=(0:length(spec)-1)*100/length(spec);

subplot(3,1,3)
plot(f,m)
title('Widmo amplitudowe');
xlabel('f[Hz]');
ylabel('amp');
