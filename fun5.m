function varargout = fun5(varargin)
    if nargin ~= 2 * nargout
        error("Zła liczba argumentów");
    end

    varargout = cell(1, nargout);

    for i = 1:nargout
        varargout{i} = varargin{2*i-1} \ varargin{2*i};
    end
end
