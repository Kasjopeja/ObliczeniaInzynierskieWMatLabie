clear variables;
clc;

c=-[75,270,250,35,10,100];
A=[7,8,6,4,3,9;
    0,0,1,-1,0,0];
b=[20;
    0];
Aeq=[1,-1,0,0,0,0;
    -1,-1,1,0,0,0];
Beq=[0;
    0];
lb=zeros(size(c));
ub=2*ones(size(c)) 
[x_opt,y_opt]=linprog(c, A, b, Aeq, Beq, lb, ub)