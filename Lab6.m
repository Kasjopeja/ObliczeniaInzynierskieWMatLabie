clear variables;
close all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%

x=-1:0.05:1;
f=@(x)1./(1-x);
y=f(x)
figure('Color', [1,1,1], 'Position',get(0, 'ScreenSize'))
axes('Color',[0.5,0.5,0.5], 'FontSize', 16, 'NextPlot','replacechildren')
h=plot(x,y)
set(h, 'Color',[1,1,1], 'LineWidth',5)
close all;

%%%%%%%%%%%%%%%%%%%%%%%%

x= 0:0.1:6*pi;
y=exp(1i*x);
figure 
plot(x,y)
figure
plot(x,real(y))
hold on;
plot(x, imag(y))
legend('RE', 'IM')

figure
subplot(1,2,1)
plot(x,abs(y))
subplot(1,2,2)
plot(x, angle(y))

close all;

%%%%%%%%%%%%%%%%%%%%%%%%

figure
plot3(x, real(y), imag(y))
xlabel('x')
ylabel('Re(y)')
zlabel('IM(y)')

close all;

p=[1,1,1];
roots(p)
x=-2:0.1:2;
y=polyval(p,x);
plot(x,y)

a=-2:0.1:2;
b=-2:0.1:2;
[A,B]=meshgrid(a,b);
X=A+1i*B;
Y=polyval(p,X);
surf(A,B,abs(Y))
xlabel('Re(x)')
ylabel('Im(x)')
zlabel('|f(x)|')