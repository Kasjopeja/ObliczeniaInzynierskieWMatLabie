function [alfa, beta, gamma]=fun1(a,b,c) 
 
nargin
nargout

%%%%%%%%%%%%%%%%%%%%%%%%

if (a+b < c) || (b+c < a) || (a+c < b)
    error('Podane długości boków nie spełniają nierówności trójkąta.');
end

alfa = acosd((b^2 + c^2 - a^2) / (2 * b * c));
beta = acosd((a^2 + c^2 - b^2) / (2 * a * c));
gamma = acosd((a^2 + b^2 - c^2) / (2 * a * b));








