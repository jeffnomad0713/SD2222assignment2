%% Set up
m = 7; % Month of birth
d = 13; % Date of birth
a = -6; % Deceleration value (m/s^2)
g = 9.81; % Gravitational acceleration (m/s^2)

l = 3.75 + d/20; % Wheelbase (m)
rr = 0.465 + m/200; % Rolling radius (m)
lambda = 0.6; % Distance between front axle and COG

%% Loaded case
m1_ld = 6500 + 200 * (12 - m); % Mass on the front axle (kg)
m2_ld = 11500 - 200 * (12 - m); % Mass on the rear axle (kg)
k_ld = (136 + d) / 5 / (84 + d); % Loaded case dimensionless parameter

%% Unloaded case
m1_uld = 4800 + 100 * (12 - m); % Mass on the front axle (kg)
m2_uld = 3700 - 100 * (12 - m); % Mass on the rear axle (kg)
k_uld = 22 / (90 + d); % Unloaded case dimensionless parameter

%% Calculations
gamma = -a / g; % Dimensionless deceleration
ar=-a; % retardation value
% For Loaded Case
N1_ld = m1_ld * g * (1 - lambda) + m1_ld * ar * k_ld; % Equation (3)
N2_ld = m2_ld * g * lambda - m2_ld * ar * k_ld; % Equation (4)
beta_opt_ld = 1 - lambda + k_ld * gamma; % Optimal brake force distribution for loaded case

% For Unloaded Case
N1_uld = m1_uld * g * (1 - lambda) + m1_uld * ar * k_uld; % Equation (3)
N2_uld = m2_uld * g * lambda - m2_uld * ar * k_uld; % Equation (4)
beta_opt_uld = 1 - lambda + k_uld * gamma; % Optimal brake force distribution for unloaded case

%% Display results
disp(['Optimal brake force distribution for loaded case: ', num2str(beta_opt_ld)]);
disp(['Optimal brake force distribution for unloaded case: ', num2str(beta_opt_uld)]);
disp(['N1_ld ', num2str(N1_ld)]);
disp(['N1_uld ', num2str(N1_uld)]);
disp(['N2_ld ', num2str(N2_ld)]);
disp(['N2_uld ', num2str(N2_uld)]);

%{
cylinder_type:  1= type 14;   2= type 16;   3= type 20;   4= type 24;   5= type 27;
pressure:       [0,10.5];
%} 
function B=brake_force_calc(cylinder_type, pressure)

    f_cylinder=[4500 5700 7000 8200 9700];

    B=f_cylinder(cylinder_type)*(pressure-0.3)/(6.1-0.3)*3.95/rr;

end

