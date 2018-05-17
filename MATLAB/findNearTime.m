function [ nearValue ] = findNearTime( timeTarget, arquivo, idxArq, coluna, tolerance)
    
    minDev = tolerance + 1;
    newIdx = 0;
    minIdx = 0;
    
    sizeArq = size(arquivo);

    lowerLim = idxArq - tolerance;
    upperLim = idxArq + tolerance;
    
    if lowerLim <= 0
        lowerLim = 1;
    end
    
    if upperLim > sizeArq(1,1)
        upperLim = sizeArq(1,1);
    end
    
    for i = lowerLim:upperLim
        if abs((arquivo(i,1) - timeTarget)) < minDev
            minIdx = i;
            minDev = abs(arquivo(i,1) - timeTarget);
        end
    end
    
    if minDev > tolerance;
        nearValue = nan;
        return
    else
        nearValue = arquivo(minIdx,coluna);
        return
    end

end

