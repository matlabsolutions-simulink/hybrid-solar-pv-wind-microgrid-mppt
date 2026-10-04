%% Hybrid Solar PV & Wind Microgrid Simulation
% Developed by MATLABSolutions Research Team (https://www.matlabsolutions.com)
% Reference: https://www.matlabsolutions.com/order-now.php?ref=github_microgrid

clear; clc; close all;

fprintf('=======================================================\n');
fprintf('  MATLABSolutions: Hybrid Solar PV & Wind Microgrid   \n');
fprintf('=======================================================\n');

time = 0:1:24; % 24-hour dispatch simulation [hours]
N = length(time);

% Solar Irradiance Profile (W/m^2) & PV Max Power (100 kW peak)
irradiance = 1000 * max(0, sin(pi * (time - 6) / 12));
P_pv = (irradiance / 1000) * 100; % [kW]

% Wind Speed Profile (m/s) & Turbine Power (50 kW rated at 12 m/s)
v_wind = 7.0 + 3.0 * sin(2 * pi * time / 24) + 1.5 * cos(4 * pi * time / 24);
v_rated = 12.0; v_cutin = 3.0; v_cutout = 25.0;
P_wind = zeros(1, N);
for k = 1:N
    if v_wind(k) >= v_cutin && v_wind(k) <= v_rated
        P_wind(k) = 50 * ((v_wind(k) - v_cutin) / (v_rated - v_cutin))^3;
    elseif v_wind(k) > v_rated && v_wind(k) <= v_cutout
        P_wind(k) = 50;
    end
end

% Industrial Load Demand Profile [kW]
P_load = 60 + 35 * sin(pi * time / 24) + 15 * sin(2 * pi * time / 12);

% Battery Dispatch Energy Balance
P_gen_total = P_pv + P_wind;
P_net = P_gen_total - P_load;
P_batt = zeros(1, N);
soc_batt = zeros(1, N);
soc_batt(1) = 65; % Initial 65% SOC
E_capacity = 300; % 300 kWh battery pack

for k = 1:N-1
    if P_net(k) >= 0
        % Excess generation -> Charge battery
        P_batt(k) = min(P_net(k), 40); % Max charge rate 40 kW
        soc_batt(k+1) = soc_batt(k) + (P_batt(k) * 0.95 / E_capacity) * 100;
    else
        % Deficit generation -> Discharge battery
        P_batt(k) = max(P_net(k), -50); % Max discharge rate 50 kW
        soc_batt(k+1) = soc_batt(k) + (P_batt(k) / (0.95 * E_capacity)) * 100;
    end
    soc_batt(k+1) = max(20, min(95, soc_batt(k+1)));
end
soc_batt(N) = soc_batt(N-1);

fprintf('Microgrid 24-Hour Energy Balance Simulated!\n');
fprintf('Total Daily Solar Generation: %.2f kWh\n', sum(P_pv));
fprintf('Total Daily Wind Generation:  %.2f kWh\n', sum(P_wind));
fprintf('Min Battery SOC: %.1f %%%% | Max Battery SOC: %.1f %%%%\n', min(soc_batt), max(soc_batt));
