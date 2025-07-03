% run_simulation.m
% Muscle Fatigue Simulation

% time span (in seconds)
tspan = [0 300];

% initial states of muscle: [Active, Fatigued, Rested]
y0 = [1; 0; 0];  % 100% active initially

% parameters
fatigue_rate = 0.02;
recovery_rate = 0.01;
recovery_decay = 0.03;

% definition of the ODE system using a function handle
odefun = @(t, y) fatigueModel(t, y, fatigue_rate, recovery_rate, recovery_decay);

% solve the system
[t, y] = ode45(odefun, tspan, y0);

% plot results
A = y(:,1); F = y(:,2); R = y(:,3);

plot(t, A, 'b-', t, F, 'r--', t, R, 'g-.');
xlabel('Time (s)');
ylabel('Fiber Fraction');
title('Muscle Fatigue Dynamics');
legend('Active', 'Fatigued', 'Rested');
