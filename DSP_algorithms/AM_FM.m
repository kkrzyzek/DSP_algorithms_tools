%Amplitude and Frequency Modulation 

clc;
clear all;
close all;


%AM
t=0:0.001:1;
A=5;
fm=20; %czestotliwosc modulowana
fc=50; %czestotliwosc nosna
h=1; %indeks modulacji

y=A*sin(2*pi*fm*t); %sygnal modulowany
s=A*sin(2*pi*fc*t); %sygnal nosny
yam=(A+h*y).*sin(2*pi*fc*t); %AM sygnal


figure(1)
subplot(3,1,1)
plot(t,y);
title('modulowany');

subplot(3,1,2);
plot(t,s);
title('nosny');

subplot(3,1,3);
plot(t,yam);
title('AM');

%FM
t1=0:0.001:1;
A1=1;
fm1=20; %czestotliwosc modulowana
fc1=50; %czestotliwosc nosna
h1=1;

y1=A1*sin(2*pi*fm*t1); %sygnal modulowany
s1=A1*sin(2*pi*fc*t1); %sygnal nosny
yfm=A1*sin(2*pi*fc1*t+(h1.*A1*sin(2*pi*fm1*t))); %FM sygnal


figure(2)
subplot(3,1,1);
plot(t,y1);
title('modulowany');

subplot(3,1,2);
plot(t,s1);
title('nosny');

subplot(3,1,3);
plot(t,yfm);
title('FM');

