function napis=fun6(napis,l1,l2)

if nargin==2
    napis(napis==l1)='';
else
    napis(napis==l1)=l2;
end


