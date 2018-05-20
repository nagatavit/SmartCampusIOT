function [ varargout ] = calcMean(diaInit,mesInit,anoInit,diaEnd,mesEnd,anoEnd, varargin)
    global sensorData
    global timeVect
    
    indInit = findIndex(diaInit,mesInit,anoInit,sensorData);
    indEnd = findIndex(diaEnd,mesEnd,anoEnd,sensorData);
    
    numParam = nargin - 6;
    sizeTime = size(timeVect);
    
    meanValue = zeros(1,sizeTime(1,2));
    
    for i = 1:numParam
        for j = indInit:indEnd
            hold on
            sensorNaN = isnan(sensorData(j).(varargin{i}));
            sensorValue = sensorData(j).(varargin{i});
            sensorValue(sensorNaN) = 0;
            meanValue = meanValue + sensorValue;
            plot(timeVect/60,sensorData(j).(varargin{i}));
        end
        varargout{i} = meanValue/(indEnd - indInit + 1);
    end
    
end

