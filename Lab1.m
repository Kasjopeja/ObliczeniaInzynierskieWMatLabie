clear variables;
clc;
 
n = input("Podaj liczbe ");
 
czy = true
for i = 2:n-1
    if mod(n,i) == 0;
        czy=false;
        break;
    end
end

if czy
    disp("Jest pierwsza");
else
    disp("Nie jest pierwsza");
end

%%%%%%%%%%%%%%%%%%%%%%%%
 
while n>1
    for i=2:n
        if mod(n,i) == 0
            disp(i);
            n=n/i;
            break;
        end;
    end;
end;

%%%%%%%%%%%%%%%%%%%%%%%%
 
n=1000;

tic;
p=0;
for i=1:n;
    p=p+1/i^2;
end;

p=(6*p)^0.5;
disp(toc);
disp(p);

tic;
p=(6*sum(1./(1:n).^2))^0.5;
disp(toc);
disp(p);

%%%%%%%%%%%%%%%%%%%%%%%%
 
A=[2,6;
    2,6.000001];
b=[8;
    8.000001];

x = A\b; %A^-1/b

%%%%%%%%%%%%%%%%%%%%%%%%
 
A=[2,6;
    2,6];
b=[8;
    8];
 
for i=1:20
    A(2,2) = 6+10^-i;
    b(2) = 8+10^-i;
    x = A\b;
    %disp(x);
    disp(rcond(A));
    disp(i);
    disp("-------");
end
 