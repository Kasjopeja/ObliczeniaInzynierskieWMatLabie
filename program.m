clear variables;
close all;
clc;

P1=punkt;
P2=punkt(1);
P3=punkt(2,3);

%%%%%%%%%%%%%%%%%%%%%%%%

P=[P1,P2,P3]
P=[P;P]
P=repmat(P,[1,1,2])

%%%%%%%%%%%%%%%%%%%%%%%%

%plot(P)

%%%%%%%%%%%%%%%%%%%%%%%%

P2+P3

%%%%%%%%%%%%%%%%%%%%%%%%

A=punkt(1,1)
B=punkt(2,1.5)
% plot(A);
% hold on;
% plot(B);
% axis equal
% hold off;

%%%%%%%%%%%%%%%%%%%%%%%%

A:B
A:0.25:B
plot(A:0.1:B)
