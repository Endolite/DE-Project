type Model.m

m0 = [10; 1];
r = [1.1; 0.4; 1.1; 0.4];
tspan = [0 50];

[t, m] = ode45(@(t, m)model(t, m, r), tspan, m0);

subplot(2, 1, 1);
plot(t, m(:, 1));
xlabel('Time (days)');
ylabel('Firm 1 Market Capitalization');

subplot(2, 1, 2);
plot(t, m(:, 2));
xlabel('Time (days)');
ylabel('Firm 2 Market Capitalization');

function dm = model(t, m, r)
    % Competition Model
    % An adaptation of a competition model for 2 competing firms, using their
    % current market shares.

    m1 = m(1);
    m2 = m(2);

    r1 = r(1);
    r2 = r(2);
    r3 = r(3);
    r4 = r(4);

    dm = zeros(2, 1);

    dm(1) = -r1 * m1 + r2 * m1 * m2;
    dm(2) = -r3 * m2 + r4 * m1 * m2;
end

