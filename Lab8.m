clear variables;
clc;
close all;

p=[1, -3, 2, 0, -1, 3, -4];
%p=[1, 0, 0, 1];
%p=[1, 0, 0, 0, 1];

x=-1.2:0.05:2.2;

r=roots(p);


dp=polyder(p);
dr=roots(dp);
d2p=polyder(dp);
d2r=roots(d2p);

r(imag(r)~=0)=[];
dr=dr(imag(dr)==0);
d2r(d2r~=real(d2r))=[];

for u=unique(dr);
    if mod(nnz(u==dr),2)==0
        dr(dr==u)=[];
    end
end

for u=unique(d2r);
    if mod(nnz(u==d2r),2)==0
        d2r(d2r==u)=[];
    end
end
   
r=unique(r);
dr=unique(dr);
d2r=unique(d2r);

disp("Miejca zerowe: ");
disp(r);
disp("Punkty ektemalne: ");
disp(dr);
disp("Punkty przegiecia: ");
disp(d2r);

y=polyval(p,x);
plot(x, y, 'LineWidth', 2);
hold on;
plot(r, zeros(size(r)), 'rx', 'MarkerSize', 15, 'LineWidth', 2);
plot(dr, polyval(p,dr) ,'g*', 'MarkerSize', 15, 'LineWidth', 2);
plot(d2r, polyval(p,d2r), 'm+', 'MarkerSize', 15, 'LineWidth', 2);
xlabel('x')
ylabel('w(x)')
set(gca,'FontSize', 18,'XLim', [min(x),max(x)])

I=trapz(x,(1+polyval(polyder(p),x).^2).^0.5);
title(['I = '], num2str(I));

%%%%%%%%%%%%%%%%%%%%%%%%

x=-1:0.1:1;
y=rand(size(x));
plot(x,y, 'rx', 'MarkerSize',15, 'LineWidth',2);
hold on;
I=zeros(1,length(x));
E=zeros(1,length(x));

xx=-1:0.01:1;
for n=0:length(x)-1
    p=polyfit(x,y,n);
    py=polyval(p,x);
    E(n+1)=mean(abs(y-py));
    I(n+1)=trapz(x,(1+polyval(polyder(p),x).^2).^0.5);
    plot(xx,polyval(p,xx));
end

figure
subplot(2,1,1)
bar(0:length(x)-1,E)
subplot(2,1,2)
bar(0:length(x)-1,I)
set(gca,'YScale', 'log');
