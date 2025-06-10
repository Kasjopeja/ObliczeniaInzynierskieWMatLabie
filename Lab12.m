clear variables;
clc;
close all;

a = 1;
b = 0.03;
c = 0.01;
d = 0.4;

dX = @(t, X)[(a-b*X(2))*X(1);
    (c*X(1)-d) * X(2)];
T = [0, 30];
X0 = [15, 15];

[t, X] = ode45(dX, T, X0);
plot(t, X);

%%%%%%%%%%%%%%%%%%%%%%%%
close all;

function [t,X] = symulacja(alfa)
m = 1;
b = 0.2;
k = 2;
g = 9.81;

T = [0, 50];
dX = @(t, X)[X(2);
    (m * g * sin(alfa) - b * X(2) - k * X(1)) / m];

[t, X] = ode45(dX, T, [0,0]);
end

a = 0:0.01:pi/2;
Xmax=zeros(size(a));

for i=1:length(a)
    [t,X] = symulacja(a(i));
    Xmax(i) = max(X(:,1));
end

plot (a, Xmax);

%%%%%%%%%%%%%%%%%%%%%%%%
close all;

