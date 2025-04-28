clear variables;
close all;
clc;

a=-3:0.01:3;
b=-3:0.01:3;
[A,B]=meshgrid(a,b);
X=A+1i*B;

Y=X.^9;
imagesc(a,b,abs(Y));
set(gca, 'YDir', 'normal');
colorbar;
figure
imagesc(a,b,angle(Y));
set(gca, 'YDir', 'normal');
colorbar;

figure
h=surf(a,b,abs(Y), angle(Y));
set(h, 'EdgeColor', 'none');
colorbar;

close all;
%%%%%%%%%%%%%%%%%%%%%%%%

x=-5:0.01:5;
%y=gamma(x);
y=myGamma(x);
%disp([x;y]);
%plot(x,y);

a=-4:0.1:4;
b=-4:0.1:4;
[A,B]=meshgrid(a,b);
X=A+1i*B;


Y=myGamma(X);
figure
h=surf(a,b,abs(Y), angle(Y));
set(h, 'EdgeColor', 'none');
colorbar;