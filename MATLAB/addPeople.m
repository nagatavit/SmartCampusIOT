function [] = addPeople(dia, mes, ano, nPeople, initHr, initMin, endHr, endMin)
    global sensorData;
    global timeVect;
    
    index = findIndex(dia, mes, ano, sensorData);
    sizeTime = size(timeVect);
    people = zeros(1,sizeTime(1,2));
    
    for k = 1:sizeTime(1,2)
        if timeVect(k) >= initHr*60 + initMin
            break;
        end
    end
    
    for i = k:sizeTime(1,2)
        if timeVect(i) >= endHr*60 + endMin
            break
        end
        people(i) = nPeople;
    end
    
    sensorData(index).numPeople = people + sensorData(index).numPeople;
end

