function [dayVect] = sensorDayFilter(varargin)
    
    flagMatEnd = zeros(1,nargin);
    stpCond = 1;
    
    pointerMat = ones(1,3);
    
    for i = 1:nargin
        aux = size(varargin{i});
        maxSizeMat(i) = aux(1,1);
    end
    
    i = 1;
    dayOld = [99 99 9999];
    
    while stpCond
        
        [dateMin,diaMn,mesMn,anoMn] = retMinDia(pointerMat,varargin);
        
        flagDay = 1;
        
        for j = 1:nargin
            % Sensor foi usado no dia
            if dateMin(j) == 1
                if flagDay == 1
                    dayVect(i,1) = diaMn;
                    dayVect(i,2) = mesMn;
                    dayVect(i,3) = anoMn;
                    flagDay = 0;
                end
                
                % Ultimo dia medido
                dayOld = [dayVect(i,1) dayVect(i,2) dayVect(i,3)];
                
                dayVect(i,j+3) = pointerMat(j);
            end
        end
        
        % Adiciona ao "apontador" dos arquivos
        for j = 1:nargin
            if dateMin(j) == 1
                while [varargin{j}(pointerMat(j),2) varargin{j}(pointerMat(j),3) varargin{j}(pointerMat(j),4)] == dayOld;
                    if pointerMat(j) < maxSizeMat(j)
                        pointerMat(j) = pointerMat(j) + 1;
                    elseif pointerMat(j) == maxSizeMat(j)
                        flagMatEnd(j) = 1;
                        break
                    end
                end
            end
        end
        
        i = i + 1;
        if sum(flagMatEnd) == nargin
            stpCond = 0;
        end
    end
end

