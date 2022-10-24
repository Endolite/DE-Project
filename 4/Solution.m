close all;
clear all;

dom = [0, 30];
n = 1000;
dt = (dom(2) - dom(1))/50;
S0 = 141.501;

ndist = makedist('Normal', 0 , sqrt(dt));

mu = 0.00064;
sigma = 4.356;

tvals = linspace(dom(1), dom(2), n);
Svals = zeros(1, n);
Svals(1) = S0;
for i = 2:n
    t = dom(1) + (i - 1) .* dt;
    S = Svals(i - 1);
    dW = random(ndist);
    Svals(i) = S + mu .* dt + sigma .* dW
end
figure()
hold on;
plot(tvals, Svals);
xlabel('time (days from 9/27/22)')
ylabel('stock price (USD)')

% Solving for the non-stochastic term
syms s(t)
ode = diff(s, t) == s;
sol(t) = dsolve(ode);