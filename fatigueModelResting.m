function dydt = fatigueModelResting(t, y, work_duration, rest_duration, cycle_period)
    A = y(1);
    F = y(2);
    R = y(3);

    % Determine if current time is in a work or rest phase
    time_in_cycle = mod(t, cycle_period);
    if time_in_cycle <= work_duration
        % Work phase (higher fatigue, lower recovery)
        fatigue_rate = 0.04;
        recovery_rate = 0.005;
    else
        % Rest phase (no fatigue, high recovery)
        fatigue_rate = 0.0;
        recovery_rate = 0.02;
    end

    recovery_decay = 0.03;

    dA = -fatigue_rate * A + recovery_rate * R;
    dF = fatigue_rate * A - recovery_decay * F;
    dR = recovery_decay * F - recovery_rate * R;

    dydt = [dA; dF; dR];
end
