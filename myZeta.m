function output=myZeta(z)

n=1:1e5;
output=sum(1./n.^z);
end

%https://pl.wikipedia.org/wiki/Funkcja_dzeta_Riemanna