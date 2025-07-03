% Time span (in seconds)
tspan = [0 300];

% Initial conditions
y0 = [1; 0; 0];

% Work-rest cycle parameters
work_duration = 30;
rest_duration = 30;
cycle_period = work_duration + rest_duration;

% Use the rest-based model
odefun = @(t, y) fatigueModelResting(t, y, work_duration, rest_duration, cycle_period);

% Solve
[t, y] = ode45(odefun, tspan, y0);
 % Extract results
A = y(:,1);
F = y(:,2);
R = y(:,3);

% Plot results
plot(t, A, 'b-', t, F, 'r--', t, R, 'g-.');
xlabel('Time (s)');
ylabel('Fiber Fractions');
title('Muscle Fatigue with Work-Rest Cycles');
legend('Active', 'Fatigued', 'Rested');
