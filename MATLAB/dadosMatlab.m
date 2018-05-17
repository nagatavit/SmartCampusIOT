sensor3data = csvread('V_SENSOR_3_v3.csv',1);
sensor5data = csvread('V_SENSOR_5_v3.csv',1);
sensor7data = csvread('V_SENSOR_7_v3.csv',1);

dataVect = [{sensor3data} {sensor5data} {sensor7data}];

sizeDataVect = size(dataVect);

for i = 1:sizeDataVect(1,2)
    sizeDataVect(i,:) = size(dataVect{i}) - [0 4];
end

global sensorData;
global timeVect; 

sensor3label = {'tempAc','umidAc','lumiAc'};
sensor5label = {'tempInt','umidInt','CO2Int'};
sensor7label = {'tempExt','umidExt','radiExt','dirVentExt','velVentExt','pcptExt','ptOrvExt'};

sensorsLabel = [{sensor3label} {sensor5label} {sensor7label}];

sampleRate = 1;

timeVect = 1:sampleRate:1440;

sensorMeasDay  = sensorDayFilter(dataVect{1},dataVect{2},dataVect{3});

sizeTime = size(timeVect);
sizeMeas = size(sensorMeasDay);

%% Init Struct array
sensorData(1).dia = 0;
sensorData(1).mes = 0;
sensorData(1).ano = 0;

for j = 1:3
    for k = 1:sizeDataVect(j,2)
        sensorData(1).(sensorsLabel{j}{k}) = [];
    end
end
%%

for i = 1:sizeMeas(1,1)
    sensorData(i).dia = sensorMeasDay(i,1);
    sensorData(i).mes = sensorMeasDay(i,2);
    sensorData(i).ano = sensorMeasDay(i,3);
    
    for j = 1:3
        if sensorMeasDay(i,j+3) ~= 0
            for k = 1:sizeDataVect(j,2)
                %sensorsLabel{j}(k)
               if i < sizeMeas(1,1)
                   idxEnd = sensorMeasDay(i+1,j+3)-1;
               elseif i == sizeMeas(1,1)
                   idxEnd = sizeDataVect(j,1);
               end
               
               addField(i,sensorsLabel{j}{k},dataVect{j},k+4,sensorMeasDay(i,j+3),idxEnd);
            end
        end
    end
    
%     if i == sizeMeas(1,1) -1
%         break
%     end
end

% add People
for j = 1:sizeMeas(1,1)
    sensorData(j).numPeople = zeros(1,sizeTime(1,2));
end


addPeople(13,9,2016,14,9,0,12,0);
addPeople(13,9,2016,4,13,0,16,0);
addPeople(15,9,2016,4,14,0,17,0);
addPeople(20,9,2016,16,9,0,12,0);
addPeople(21,9,2016,4,10,0,12,0);
addPeople(22,9,2016,26,12,0,14,0);
addPeople(27,9,2016,3,13,30,17,30);
addPeople(28,9,2016,3,14,0,18,0);
addPeople(29,9,2016,3,9,0,12,0);
addPeople(29,9,2016,5,12,30,17,30);
addPeople(30,9,2016,4,14,0,17,30);
addPeople(6,10,2016,20,12,0,14,0);
addPeople(6,10,2016,4,15,0,18,0);
addPeople(11,10,2016,16,9,0,12,0);

addPeople(18,10,2016,6,8,30,9,0);
addPeople(18,10,2016,13,9,0,9,29);
addPeople(18,10,2016,14,9,30,10,49);
addPeople(18,10,2016,15,10,50,12,0);

addPeople(25,10,2016,17,9,21,10,9);
addPeople(25,10,2016,16,10,10,10,14);
addPeople(25,10,2016,15,10,15,10,19);
addPeople(25,10,2016,16,10,20,10,22);
addPeople(25,10,2016,15,10,23,10,39);
addPeople(25,10,2016,0,10,40,10,59);
addPeople(25,10,2016,15,11,00,12,15);



