function output=myGamma(z)
   
output=1;
N = 10000;

    for n = 1:N
        temp = (1 + 1./n).^z ./ (1 + z./n);
        output = output .* temp;
    end
    output = (1./z).*output;

end