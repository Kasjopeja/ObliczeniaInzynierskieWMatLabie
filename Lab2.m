clear variables;
clc;
close all;
format rational;

S=1;
N=100;

n=1;
p=2;
si=zeros(N,1);

for i=2:N
    if si(i-1) < S
        si(i)=si(i-1)+1/n;
        disp(1/n);
        n=n+2;
    else
        si(i)=si(i-1)-1/p;
        disp(-1/p);
        p=p+2;
    end
end

plot(si);

%%%%%%%%%%%%%%%%%%%%%%%%

format short;

N=10000;
ile=0;

for i=1:N
    a=2*pi*rand;
    x1=cos(a);
    y1=sin(a);
    a=2*pi*rand;
    x2=cos(a);
    y2=sin(a);
    d=norm([x1-x2;y1-y2]);
    if d>sqrt(3)
        ile=ile+1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%

disp(ile/N*100);

x=-3:0.1:0.9;
y=1./(1-x);
plot(x,y);
