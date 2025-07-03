function dydt = fatigueModel(t, y, fatigue_rate, recovery_rate, recovery_decay)
    A = y(1);
    F = y(2);
    R = y(3);

    dA = -fatigue_rate * A + recovery_rate * R;
    dF = fatigue_rate * A - recovery_decay * F;
    dR = recovery_decay * F - recovery_rate * R;

    dydt = [dA; dF; dR];
end
