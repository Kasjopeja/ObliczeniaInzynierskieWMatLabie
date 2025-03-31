function ile=fun2(varargin) 

ile=0;
for i=1:numel(varargin)
    if isscalar(varargin{i}) %numel(varargin{1})==1
        ile=ile+1;
    end
end


