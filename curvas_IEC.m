%% Material didático para análise das Curvas IEC
% Elaborado por Jean Patrick Prigol com o objetivo de demonstrar a
% características das curvas de atuação dos relés de proteção

clc, clear all, close all
% Normal Inversa - IEC-NI (1)
% Muito Inversa - IEC-MI (2)
% Extremamente Inversa - IEC-EI (3)
IEC = [0.14 0.02; 13.5 1; 80 2];

% dial de tempo / TMS / DT
DIAL = 0.5;

% corrente de pickup - Início da curva
Ipickup = [100 100 100]; % iguais para comparar as três curvas

% configuração dos vetores
np = 10e4;

for i=1 : length(IEC)
    for j=0 : np
        I(i,j+1) = Ipickup(i)+(j)/10;
        temp(i,j+1) = (IEC(i,1)/((I(i,j+1)/Ipickup(i))^IEC(i,2)-1))*DIAL;
    end
    loglog(I(i,:),temp(i,:),'LineWidth',2), hold on;
end

grid on
xlim([10 10000])
ylim([0.1 1000])
xlabel('corrente (A)','FontSize',14)
ylabel('tempo (s)','FontSize',14)
legend("IEC Normal Inversa", "IEC Muito Inversa", ...
    "IEC Extremamente Inversa",'location','southwest','FontSize',10)

%% Curvas IEC - variação do DIAL
clc, clear all, close all
% Normal Inversa - IEC-NI (1)
% Muito Inversa - IEC-MI (2)
% Extremamente Inversa - IEC-EI (3)
IEC = [0.14 0.02; 13.5 1; 80 2];

% dial de tempo / TMS / DT
DIAL = [0.1 0.3 0.5];

% corrente de pickup - Início da curva
Ipickup = [100 100 100]; % iguais para comparar as três curvas

% configuração dos vetores
np = 10e4;

for i=1 : length(DIAL)
    for j=0 : np
        I(i,j+1) = Ipickup(1)+(j)/10;
        temp(i,j+1) = (IEC(1,1)/((I(i,j+1)/Ipickup(i))^IEC(1,2)-1))*DIAL(i);
    end
    loglog(I(i,:),temp(i,:),'LineWidth',2), hold on;
end

grid on
xlim([10 10000])
ylim([0.1 100])
xlabel('corrente (A)','FontSize',14)
ylabel('tempo (s)','FontSize',14)
title("IEC Normal Inversa")
legend("DIAL = 0,1",'DIAL = 0,3', 'DIAL = 0.5', 'location','southwest','FontSize',10)
