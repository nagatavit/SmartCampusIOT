sizeData = size(sensorData);
sizeTime = size(timeVect);

k = 1;

for i = 1:sizeData(1,2)
    if max(sensorData(i).numPeople) > 0
        idx(k) = i;
        k = k + 1;
    end
end

sizeIdx = size(idx);

k = 1;


% for i = 3:sizeIdx(1,2)
%    subplot(2,1,1)
%    hold on
%    plot(timeVect/60,sensorData(idx(i)).CO2Int)
%    subplot(2,1,2)
%    hold on
%    plot(timeVect/60,sensorData(idx(i)).numPeople)
% end


% for i = 1:sizeIdx(1,2)
%      sizeCO2sensorData = size(sensorData(idx(i)).CO2Int);
%      sizeTime(1,2);
%     if size(sensorData(idx(i)).CO2Int) < sizeTime(1,2)
%     else
%         for j = 1:sizeTime(1,2)
%             usableDataPeople(k,1) = sensorData(idx(i)).numPeople(j);
%             usableDataPeople(k,2) = sensorData(idx(i)).CO2Int(j);
%             usableDataPeople(k,3) = sensorData(idx(i)).tempAc(j);
%             k = k + 1;     
%         end
%         plotyy(timeVect/60,sensorData(idx(i)).CO2Int,timeVect/60,sensorData(idx(i)).numPeople)
%     end
% end


for i = 1:sizeData(1,2)
    if size(sensorData(i).CO2Int) < sizeTime(1,2)
    elseif max(sensorData(i).numPeople) > 0
        for j = 1:sizeTime(1,2)
            if sensorData(i).numPeople(j) ~= 0
                usableDataPeople(k,1) = sensorData(i).numPeople(j);
                usableDataPeople(k,2) = sensorData(i).CO2Int(j);
                usableDataPeople(k,3) = sensorData(i).tempAc(j);
                k = k + 1;
            end
        end
    end
end

nPeople = usableDataPeople(:,1);
CO2People = usableDataPeople(:,2);
tempAcPeople = usableDataPeople(:,3);

figure
scatter(nPeople, CO2People,'filled')
title('CO2 x People');
grid

figure
scatter(nPeople, tempAcPeople,'filled')
title('Temp x People');
grid