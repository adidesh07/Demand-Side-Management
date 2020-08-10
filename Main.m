clc;
clear all;
close all;

User_1=[0.42 0.42 0.42 0.5 0.5 0.6 0.7 0.2 0.2 0.3 0.2 0.4 0.4 0.4 0.4 0.3 0.2 0.6 0.7 0.84 0.84 0.84 0.25 0;
0 0 0 0 0 0 0 0 0.11 0.11 0.11 0.11 0 0 0 0 0 0 0.11 0.11 0.11 0 0 0;
0 0 0 0 0 0 0 0 0 0.03 0.08 0.08 0.08 0.08 0 0 0 0 0.08 0.08 0.03 0 0 0;
0 0 0 0 0 0 0 0 0 0.42 0.75 0.31 0 0 0 0 0.84 0.21 0 0 0 0 0 0;
0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11 0.11;
1.17 1.17 1.17 1.17 0.2 0 0 0 0 0 0 0 0 0.5 1 0 0 0 0 0.2 0.8 0.7 0.9 1.7;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.4 0 0 0 0 1.6 0 0 0 0;
0 0 0 0 0 0 0 0.16 0 0 0 0 0 0 0 0 0 0 0.8 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.5 1.5 0 0 0 0;
0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0.7 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 3 0 0 0];

User_2=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

User_3=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

load1 = sum(User_1);
load2 = sum(User_2);
load3 = sum(User_3);

Totalload = sum(User_1) + sum(User_2) + sum(User_3);

crossover = 20*ones(1,24);

movable_Devices = 6;
fixed_Devices = size(User_1,1) - movable_Devices;
Time = 24;

Crossover_Before_Shifting = sum(User_1) + sum(User_2) + sum(User_3);
[Temp_User_1, Temp_User_2, Temp_User_3] = Process(User_1, User_2, User_3, movable_Devices);
Generation_After_Shifting = sum(Temp_User_1) + sum(Temp_User_2) + sum(Temp_User_3);

Generation_Cost_Before_Shifting = 0;

for t = 1:Time
    if ((t==8)||(t==15)||(t==19)||(t==20)||(t==21))
        p = 8.5; %peak hour price   
    else
        p = 4; %off-peak hour price
    end
    
    hourcost1(t) = Crossover_Before_Shifting(t) * p; %Hourly cost
    Generation_Cost_Before_Shifting = Generation_Cost_Before_Shifting + hourcost1(t);

end


fprintf('Cost Before GA: %s\n', num2str(Generation_Cost_Before_Shifting));

Generation_Cost_After_Shifting=0;
for t=1:24
    if ((t==8)||(t==15)||(t==19)||(t==20)||(t==21))
        p = 8.5; %peak hour price   
    else
        p = 4; %off-peak hour price
    end
        
    hourcost(t) = Generation_After_Shifting(t) * p; % Hourly cost
    Generation_Cost_After_Shifting = Generation_Cost_After_Shifting + hourcost(t);
end

fprintf('Cost After GA: %s\n', num2str(Generation_Cost_After_Shifting));

Agg_Load_Before=Crossover_Before_Shifting;
Peak_Load_Before=max(Crossover_Before_Shifting);
Avg_Load_Before=(sum(Crossover_Before_Shifting))/24;
PAR_Before=Peak_Load_Before/Avg_Load_Before;

Agg_Load_After=Generation_After_Shifting;
Peak_Load_After=max(Generation_After_Shifting);
Avg_Load_After=(sum(Generation_After_Shifting))/24;
PAR_After=Peak_Load_After/Avg_Load_After;

%Load curve User 1 w/o GA
figure
t=1:Time;
stairs(t,load1);
legend('Without Using GA');
title('Total Load Curve User 1');
xlabel('Time');
ylabel('Load (kW)');
grid minor;

%Load Curve User 2 w/o GA
figure
t=1:Time;
stairs(t,load2);
legend('Without Using GA', 'location', 'northwest');
title('Total Load Curve User 2');
xlabel('Time');
ylabel('Load (kW)');
grid minor;

%Load Curve User 3 w/o GA
figure
t=1:Time;
stairs(t,load3);
legend('Without Using GA');
title('Total Load Curve User 3');
xlabel('Time');
ylabel('Load (kW)');
grid minor;

%Load Curve all Users w/o GA
figure
t=1:Time;
stairs(t,Totalload);
legend('Without Using GA');
title('Total Load Curve');
xlabel('Time');
ylabel('Load (kW)');
grid minor;

%Comparison with and w/o GA
figure
t=1:Time;
stairs(t, Crossover_Before_Shifting);
hold on;
stairs(t, Generation_After_Shifting, 'r');
hold on;
legend('Without Using GA','With using GA', 'location', 'northwest');
title('Total load curve Comparison');
xlabel('Time');
ylabel('Load (kW)');
grid minor;

%Cost curve with GA
figure
t=1:Time;
stairs(t, hourcost1);
hold on;
stairs(t,hourcost);
hold off;
grid minor;
legend('without Using GA','with using GA', 'location', 'northwest');
title('After Shifting cost curve');
xlabel('Time');
ylabel('Cost (Rs)');






