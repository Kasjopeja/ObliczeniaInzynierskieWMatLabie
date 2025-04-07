classdef punkt
    properties
        x;
        y;
    end

    methods
        function P=punkt(x,y)
            if nargin==0     
                P.x = 0;
                P.y = 0;
            elseif  nargin==1
                if isa(x,'punkt')
                    P.x = x.x;
                    P.y = x.y;
                else
                    P.x=x;
                    P.y=0;
                end
            else
                 P.x = x;
                 P.y = y;
            end
        end

        function disp(P)
            %disp(['(',num2str(P.x),',',num2str(P.y),')']);
            for i=1:numel(P)               
                fprintf('(%.2f,%.2f)\n', P(i).x,P(i).y);
            end
        end

        function plot(P)            
          for i=1:numel(P)
                %X=[P.x];
                %Y=[P.y];
                plot(P(i).x,P(i).y,'rx', 'MarkerSize', 15, 'LineWidth', 3)
                hold on;
          end          
            %plot(X,Y)
            hold off;
        end

        function P=plus(A,B)
            P=punkt(A.x+B.x, A.y+B.y);
        end

        function P = colon(A, k, B)
        if nargin == 2
            B = k;  
            k = 1;  
        end

        n = floor(norm([B.x - A.x, B.y - A.y]) / k);
        
        dx = (B.x - A.x) / n;
        dy = (B.y - A.y) / n;

        for i = 0:n
            P(i+1) = punkt(A.x + i * dx, A.y + i * dy);
        end
    end
    end
end
