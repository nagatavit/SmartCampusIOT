function [ index ] = findIndex( diaTgt, mesTgt, anoTgt, matTgt )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
matTargetSize = size(matTgt);

for i = 1:matTargetSize(1,2)
    if (matTgt(i).dia == diaTgt) && (matTgt(i).mes == mesTgt) && (matTgt(i).ano == anoTgt)
        break
    end
end

index = i;
end

