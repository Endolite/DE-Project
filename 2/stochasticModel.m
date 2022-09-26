t0 = 0;
T = 1
n = 1000;
dt = (T - t0)/n;
mu = 1;
sigma = 0.5;
dW = zeros(1, n);
axis = [t0 + dt:dt:T];
S = zeros(1, n);
S(1) = 1;

for k = 2:n
    dW(k) = sqrt(dt) * randn;
    S(k) = S(k - 1) + (mu * S(k) * dt) + (sigma * S(k - 1) * dW(k - 1));  
end

plot(axis, S);
xlabel('time');
ylabel('stock price');
