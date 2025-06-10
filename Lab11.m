clear variables;
clc;
close all;

A = [1,1;
    -1, 1;
    -1,-1;
    1,-1];
b = [5;
    5;
    5;
    5];

x0 = 10*rand(2,1)-5;

a = [5;5];
f = @(x) (x(1) - a(1)).^2 + (x(2) - a(2)).^2;
 
[xopt, yopt] = fmincon(f, x0, A, b)

%%%%%%%%%%%%%%%%%

function [c,ceq]=nielin(x)

    ceq = [-1];
    if x(2) > 0;
        c = x(1).^2 + x(2).^2 - 1;
    else
        c = -1;
    end
end

A = [1,-1];
b = [1];
lb = [-1;
    -1];

x0 = [-0.5; -0.5];

a = [1;1];
f = @(x) (x(1) - a(1)).^2 + (x(2) - a(2)).^2;
[xopt, yopt] = fmincon(f, x0, A, b, [], [], lb, [], @nielin)

%%%%%%%%%%%%%%%%%

