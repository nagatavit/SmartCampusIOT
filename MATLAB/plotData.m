function [] = plotData(day, month, year, varargin)

global sensorData;
global timeVect;

index = findIndex(day, month, year,sensorData);
date = strcat(num2str(day), '/', num2str(month), '/', num2str(year))

for i = 1:nargin-3
    subplot(nargin-3,1,i)
    field = varargin{i};
    plot(timeVect/60, sensorData(index).(field));
    
    ylabel(field);
    xlim([7 20]);
    set(gca,'XTick',(0:24));
end


%title();
xlabel('Tempo(H)');

%set(gca,'XTick',(0:24))

% xlim([0 24])
% ylim([18 30])

legend(date);

end
