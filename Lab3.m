clear variables;
clc;

w=randi(100,1,10)
nnz(w>50) 
sum(w(w>50))
%w(w<50)=0

%%%%%%%%%%%%%%%%%%%%%%%%

mean(w)
nnz(abs(w-mean(w))<20)
sum(w(abs(w-mean(w))<20))
sum(w(2:2:end))

%%%%%%%%%%%%%%%%%%%%%%%%

%w(w<50)=[]
i=1;
while i<=length(w)
    if w(i)<50
        w(i)=[];
    else
        i=i+1;
    end
end

disp(w);

M=randi(20,2,2,2,2)
M(:)
mean(M(:))
nnz(M>mean(M(:)))

%%%%%%%%%%%%%%%%%%%%%%%%

M=randi(20,4)
mean(M)
mean(mean(M)) %po wierszach 
S=sum(M) %S=sum(M,2)
[~,i]=sort(S)
M(:,i) %M(i,:)

[~,i]=sort(M(:,i));
M(i,:)

%%%%%%%%%%%%%%%%%%%%%%%%

M=randi(100,4,5)
M
min(M(:))
[i,j]=find(M==min(M(:)),1)
M1=M(max(i-1,1):min(i+1,size(M,1)),max(j-1,1):min(j+1, size(M,2)))