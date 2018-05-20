function [ dateMin, diaMn, mesMn, anoMn ] = retMinDia(row,varargin)

    sizeInput = size(varargin{1});
    sizeInput = sizeInput(1,2);
    
    dia = zeros(1,sizeInput);
    mes = zeros(1,sizeInput);
    ano = zeros(1,sizeInput);
    dateMin = ones(1,sizeInput);
    
    % Armazena dias, meses e anos
    for i = 1:sizeInput
       dia(i) = varargin{1}{i}(row(i),2);
       mes(i) = varargin{1}{i}(row(i),3);
       ano(i) = varargin{1}{i}(row(i),4);
    end
    
    n = min(ano);
        
    % filtro ano
    for i = 1:sizeInput
        if ano(i) > n
            dateMin(i) = 0;
            mes(i) = 99;
        end
    end
    
    n = min(mes);
    
    % filtra mes
    for i = 1:sizeInput
        if dateMin(i) == 1
            if mes(i) > n
                dateMin(i) = 0;
                dia(i) = 99;
            end
        end
    end
    
    n = min(dia);
    
    for i = 1:sizeInput
        if dateMin(i) == 1
            if dia(i) > n
                dateMin(i) = 0;
            end
        end
    end
    
    for i = 1:sizeInput
       if dateMin(i) == 1
           diaMn = dia(i);
           mesMn = mes(i);
           anoMn = ano(i);
       end
    end
    
end

