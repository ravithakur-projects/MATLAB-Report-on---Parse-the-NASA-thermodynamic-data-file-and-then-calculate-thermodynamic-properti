% Programmed by Ravi Thakur
close all
clear all
clc

R =8.314
f1 = fopen(\'THERMO.dat\',\'r\');
fprintf(\'Data file title: %sn\', fgetl(f1))

globle_temp = strsplit(fgetl(f1),\' \')
globle_low = str2double(globle_temp{2})
globle_mid = str2double(globle_temp{3})
globle_high = str2double(globle_temp{4})

ct = 2;

for i=1:3
    fgetl(f1);
    ct = ct+1;
end

lines = 0;
f2 = fopen(\'THERMO.dat\',\'r\');
while fgetl(f2) ~= -1
    lines = lines + 1;
end

lines = lines - ct;
fclose(f2);

for i = 1:lines/4 
    sline = strsplit(fgetl(f1),\' \');
    fprintf(\'calculation for: %s\', sline{1})


local_low = str2double(sline{length(sline)-3})
local_mid = str2double(sline{length(sline)-1})
local_high = str2double(sline{length(sline)-2})

T = linspace(local_low,local_high,200);

% Molecular weight calculation
% Mol. Wt. Calculated separately in function \"molecular_weight_calculation\"
fprintf(\'Molecular weight of %s is %fn\', sline{1}, molecular_weight_calculation(sline(1)))
dline1 = fgetl(f1);
a = strfind(dline1, \'E\');
dline2 = fgetl(f1);
dline3 = fgetl(f1);

h_temp1 = str2double(dline1(1:a(1)+3));
h_temp2 = str2double(dline1(a(1)+4:a(2)+3));
h_temp3 = str2double(dline1(a(2)+4:a(3)+3));
h_temp4 = str2double(dline1(a(3)+4:a(4)+3));
h_temp5 = str2double(dline1(a(4)+4:a(5)+3));
h_temp6 = str2double(dline2(1:a(1)+3));
h_temp7 = str2double(dline2(a(1)+4:a(2)+3));

l_temp1 = str2double(dline2(a(2)+4:a(3)+3));
l_temp2 = str2double(dline2(a(3)+4:a(4)+3));
l_temp3 = str2double(dline2(a(4)+4:a(5)+3));
l_temp4 = str2double(dline3(1:a(1)+3));
l_temp5 = str2double(dline3(a(1)+4:a(2)+3));
l_temp6 = str2double(dline3(a(2)+4:a(3)+3));
l_temp7 = str2double(dline3(a(3)+4:a(4)+3));

for k = 1:length(T)
    if T(k) > local_low
        cp(k) = R*(h_temp1+(h_temp2*(T(k)))+(h_temp3*(T(k))^2)+(h_temp4*(T(k))^3)+(h_temp5*(T(k))^4));
        H(k) = R*T(k)*(h_temp1+((h_temp2*T(k))/2)+((h_temp3*T(k))^2/3)+((h_temp4*T(k))^3/4)+((h_temp5*T(k))^4/5)+(h_temp6/T(k)));
        S(k) = R*((h_temp1*log(T(k)))+(h_temp2*T(k))+((h_temp3*(T(k))^2)/2)+((h_temp4*(T(k))^3)/3)+((h_temp5*(T(k))^4)/4)+h_temp7);
    else % low temp coefficents usef for temps < median temperature\'
        cp(k) = R*(l_temp1+(l_temp2*(T(k)))+(l_temp3*(T(k))^2)+(l_temp4*(T(k))^3)+(l_temp5*(T(k))^4));
        H(k) = R*T(k)*(l_temp1+((l_temp2*T(k))/2)+((l_temp3*T(k))^2/3)+((l_temp4*T(k))^3/4)+((l_temp5*T(k))^4/5)+(l_temp6/T(k)));
        S(k) = R*((l_temp1*log(T(k)))+(l_temp2*T(k))+((l_temp3*(T(k))^2)/2)+((l_temp4*(T(k))^3)/3)+((l_temp5*(T(k))^4)/4)+l_temp7);
    end
end

mkdir([\'Species Graph \',sline{1}])
cd([\'Species Graph \',sline{1}])

figure(1)
plot(T,cp,\'linewidth\',2,\'color\',\'r\')
xlabel(\'Temperature (k)\')
ylabel(\'Specific heat(J/kgk)\')
title([\'Specific Heat Vs. Temperature for \', sline{1}])
grid on
saveas(1,[\'Specific Heat Vs. Temperature for \', sline{1},\'.jpg\'])


figure(2)
plot(T,H,\'linewidth\',2,\'color\',\'g\')
xlabel(\'Temperature (k)\')
ylabel(\'Enthalpy (J)\')
title([\'Enthalpy Vs. Temperature for \', sline{1}])
grid on
saveas(2,[\'Enthalpy Vs. Temperature for \', sline{1},\'.jpg\'])


figure(3)
plot(T,S,\'linewidth\',2,\'color\',\'b\')
xlabel(\'Temperature (k)\')
ylabel(\'Entropy(J/k)\')
title([\'Entropy Vs. Temperature for \', sline{1}])
grid on
saveas(3,[\'Entropy Vs. Temperature for \', sline{1},\'.jpg\'])

cd ..
cd ..

disp(\'______________________________________________________________________________________________________________________________________\');

end


fclose(f1);