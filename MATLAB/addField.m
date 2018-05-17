function [ ] = addField( idxField, fieldName, arquivo, coluna, idxInit, idxEnd )
    global sensorData;
    global timeVect;
    
    sizeTime = size(timeVect);
    sizeArq = size(arquivo);
    measVect = NaN(1,sizeTime(1,2));
    
    i = idxInit;
    k = 1;
    
     while i <= idxEnd
        if  timeVect(k) < arquivo(i,1)
            while timeVect(k) < arquivo(i,1)
               k = k +1; 
            end
            k = k - 1;
        elseif timeVect(k) == arquivo(i,1)
          measVect(k) = arquivo(i,coluna);
          i = i + 1;
        else
          %measVect(k) = findNearTime(timeVect(k),arquivo, i,coluna,5);
          while timeVect(k) > arquivo(i,1)
            i = i + 1;
            if i > sizeArq(1,1);
                break
            end
            
          end
          
          measVect(k) = findNearTime(timeVect(k),arquivo, i,coluna,5);
        end
        
        k = k +1;
        
        if k == sizeTime(1,2)
            break
        end
        
    end
    
    sensorData(idxField).(fieldName) = measVect;

end

