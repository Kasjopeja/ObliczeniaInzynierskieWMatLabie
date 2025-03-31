function varargout = fun3(varargin) 

    ile = zeros(1, nargin); 
    for i = 1:numel(varargin) 
        ile(i) = numel(varargin{i}); 
    end

    [~, indx] = sort(ile);
    varargout = varargin(indx);
    disp(varargout);
    
