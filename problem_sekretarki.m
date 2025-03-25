clear variables;
clc;

ilosc_kan=1000;
N=1000;
sukces=zeros(1,ilosc_kan-1);

for k=1:ilosc_kan-1
    for i=1:N
        ocena=randperm(ilosc_kan);
        naj_k=max(ocena(1:k));
        index=find(ocena>naj_k,1); 
        if isempty(index)
            zatr=ocena(end);
        else
            zatr=ocena(index);
        end
        if zatr==ilosc_kan
            sukces(k)=sukces(k)+1;
        end
    end
end

bar(sukces);

