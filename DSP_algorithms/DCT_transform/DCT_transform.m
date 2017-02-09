%DCT Transform

clc;
clear all;
close all;
%load test_signal1.mat 
load test_signal2.mat

N=length(s);
c0=sqrt(1/N);
ck=sqrt(2/N);
temp=[];
s=x;

for k=1:1:N
    
    for n=1:1:N
       
        temp(n)=s(n)*cos((pi*(2*(n-1)+1)*(k-1))/(2*N));

    end

X_dct(k)=sum(temp);

end

X_dct(1)=X_dct(1)*c0;
X_dct(2:end)=X_dct(2:end)*ck;

figure(1)
stem(X_dct,'rx') %DCT z algorytmu
hold on

stem(dct(s),'b+'); %DCT matlaba
title('Porownanie DCT - algorytm/matlab');
xlabel('probki');
ylabel('amp');

prog=0.5;

%progowanie twarde
for i=1:1:N

    if abs(X_dct(i))<=0.5
        X_dct(i)=0;
    end
end

a=idct(X_dct); %IDCT

figure(2);
plot(x(1:N),'b') %sygnal zrodlowy

hold on
plot(a(1:N),'r'); %sygnal po progowaniu




