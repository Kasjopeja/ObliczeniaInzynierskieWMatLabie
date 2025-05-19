clear variables;
clc;
close all;

% Dane wejściowe
x = -1:0.1:1;
y = x.^2 + 0.25 * randn(size(x));

% Aproksymacja 1: Sieć neuronowa
SSN = fitnet(10);                  % Sieć neuronowa z 10 neuronami
SSN = train(SSN, x, y);           % Trenowanie sieci

% Aproksymacja 2: Interpolacja spline
SP = spline(x, y);                % Interpolacja typu spline

% Aproksymacja 3: Dopasowanie funkcji z sinusoidą
Fsin = fittype('x.^2 + a*sin(b*x) + c');  % UZUPEŁNIENIE: brakujące argumenty
Fsin = fit(x.', y.', Fsin);              % Dopasowanie modelu

% Obliczenie wyników dla punktów treningowych
ySSN = sim(SSN, x);
ySP = ppval(SP, x);
yFsin = Fsin(x)';

% Błąd średni bezwzględny (MAE)
eSSN = mean(abs(y - ySSN));
eSP = mean(abs(y - ySP));
eFsin = mean(abs(y - yFsin));

% Długość krzywej (dyskretna aproksymacja)
iSSN = trapz(x(1:end-1), sqrt(1 + (diff(ySSN)./diff(x)).^2));
iSP = trapz(x(1:end-1), sqrt(1 + (diff(ySP)./diff(x)).^2));
iFsin = trapz(x(1:end-1), sqrt(1 + (diff(yFsin)./diff(x)).^2));

% Siatka do rysowania gładkiego wykresu
xx = linspace(min(x), max(x), 200);   
ySSN = sim(SSN, xx);                  
ySP = ppval(SP, xx);
yFsin = Fsin(xx);

% Wykres porównawczy dopasowań
figure;
plot(x, y, 'rx', 'MarkerSize', 15, 'LineWidth', 2); hold on;
plot(xx, ySSN, 'LineWidth', 2);
plot(xx, ySP, 'LineWidth', 2);
plot(xx, yFsin, 'LineWidth', 2);
legend('Data', 'SSN', 'SPLINE', 'F+sin')
set(gca, 'FontSize', 28)

% Wykres błędów i długości
figure
subplot(2,1,1)
bar([eSSN, eSP, eFsin])
set(gca, 'XTickLabel', {'SSN', 'SPLINE', 'F+sin'})
title('BŁĄD')
set(gca, 'FontSize', 28)

subplot(2,1,2)
bar([iSSN, iSP, iFsin])
set(gca, 'XTickLabel', {'SSN', 'SPLINE', 'F+sin'})
title('DŁUGOŚĆ')
set(gca, 'FontSize', 28)

%%%%%%%%%%%%%%%%%%%%%%%%
close all 

f1=randi(3000)+1000;
f2=randi(3000)+1000;

fs=4*8192;
L=8192;
t=(0:L-1)/fs;
y=sin(2*pi*f1*t)+sin(2*pi*f2*t);
plot(t(t<0.01),y(t<0.01));

n=2^nextpow2(L);
s=fft(y,n)/L;
s=2*abs(s(1:n/2+1));

f=linspace(0,1,n/2+1)*fs/2;
figure;
bar(f,s);


F=f(s>0.5);
fo=mean(F);

%rozdzielenie sygnałów
[l,m]=butter(12,2*fo/fs,'low');
y1=filter(l,m,y);
figure 
plot(t(t<0.01),y1(t<0.01));