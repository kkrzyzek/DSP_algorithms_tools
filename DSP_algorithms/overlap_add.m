%Overlap Add Algorithm

clear all;
clc;
close all;

fs=100;
N=1000;
t=0:1/fs:N/fs-1/fs;

s=sin(2*pi*5*t)+sin(2*pi*20*t); %sygnal zrodlowy

K=32; %dlugosc segmentu
Nb=20; %dlugosc segmentu sygnalu zrodlowego
fg=7; %czestotliwosc graniczna
M=13; %rzad filtra

filtr=fir1(M-1,2*fg/fs,boxcar(M));
filtr2=[filtr zeros(1,K-M)];
FILTR2=fft(filtr2);

liniowy=conv(s,filtr); %splot bezpoœredni

y=zeros(1,N+M-1);

for i=1:1:N/Nb

sn=[s(1+(i-1)*Nb:Nb+(i-1)*Nb) zeros(1,K-Nb) ];
Sn=fft(sn);
Ys=FILTR2.*Sn;
sn=ifft(Ys);
%sn=real(sn);
y(1+(i-1)*Nb:32+(i-1)*Nb)=y(1+(i-1)*Nb:32+(i-1)*Nb)+sn;
end

fftx=zeros(1,N);
for i=1:1:N
    
    if i<N/2+1
    fftx(i)=i-1;
    else fftx(i)=-1*(N+1-i);
    end
end
fftx=fftshift(fftx);
fftx=fs/N*fftx;

%dziedzina dla filtra
fftx2=zeros(1,32);
for i=1:1:32
    
    if i<32/2+1
    fftx2(i)=i-1;
    else fftx2(i)=-1*(32+1-i);
    end
end
fftx2=fftshift(fftx2);
fftx2=fs/32*fftx2;

filtr3=[filtr zeros(1,N-length(filtr))];

figure(1)
mn=abs(fftshift(fft(s)));
plot(fftx(501:end),mn(501:end), 'k'); %sygnal wejœciowy
hold on
bk=abs(fftshift(fft(y(1:1000))));
plot(fftx(501:end),bk(501:end),'r'); %sygnal wyjœciowy
hold on
kj=abs(fftshift(abs(fft(filtr3*500))));
plot(fftx(501:end),kj(501:end),'b'); %charakterystyka filtra
title('Widmo amplitudowe');
xlabel('f[Hz]');
ylabel('amp');





