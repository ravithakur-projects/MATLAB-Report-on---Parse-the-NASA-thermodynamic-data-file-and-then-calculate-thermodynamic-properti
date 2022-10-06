% Programmed by Ravi Thakur
function [molecular_wt] = molecular_weight_calculation(specimen)

molecular_wt = 0;
elements = split(specimen, \"\");
for j = 2: length(elements)-1
    n = str2num(elements{j+1});
    if elements{j} == \'C\'
        if n >= 1
            molecular_wt = molecular_wt + (n*12);
        else
            molecular_wt = molecular_wt + 12;
        end
    elseif elements{j} == \'H\'
        if n >= 1
            molecular_wt = molecular_wt + (n*1);
        else
            molecular_wt = molecular_wt + 1;
        end
         elseif elements{j} == \'O\'
        if n >= 1
            molecular_wt = molecular_wt + (n*1);
        else
            molecular_wt = molecular_wt + 16;
        end
    elseif elements{j} == \'N\'
        if n >= 1
            molecular_wt = molecular_wt + (n*14);
        else
            molecular_wt = molecular_wt + 14;
        end
    elseif (elements{j} == \'A\') && (elements{j+1} == \'R\') 
        if n >= 1
            molecular_wt = molecular_wt + (n*40);
        else
            molecular_wt = molecular_wt + 40;
        end
    end
end
molecular_wt;