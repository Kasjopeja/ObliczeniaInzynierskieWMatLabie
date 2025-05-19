function output=myZeta(z)

n=1:1e5;
output=sum(1./n.^z);
end

%https://pl.wikipedia.org/wiki/Funkcja_dzeta_Riemanna

function y=MyZetaCmpx(z)

y=0;
for n=0:1e2
    y1=0;
    for k=0:n
        y1=y1+(-1)^k*nchoosek(n,k)*(k+1)^-z;
    end
    y=y+y1/(2^(n+1));
end
y=y/(1-(2^(1-z)));
end