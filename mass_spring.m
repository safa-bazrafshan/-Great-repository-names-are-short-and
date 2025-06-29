% System parameters
m = 1;    % Mass (kg)
b = 10;   % Damping coefficient (Ns/m)
k = 20;   % Spring constant (N/m)

% Transfer function: X(s)/F(s) = 1 / (ms^2 + bs + k)
num = [1];
den = [m b k];

sys = tf(num, den);
step(sys)
title('Step Response of Open-Loop System')
% PID Controller gains
Kp = 350;
Ki = 300;
Kd = 50;

% Create PID controller
C = pid(Kp, Ki, Kd);

% Closed-loop system: T(s) = C(s)G(s)/(1 + C(s)G(s))
T = feedback(C * sys, 1);

% Plot step response with PID controller
figure;
step(T)
title('Step Response with PID Controller')
info = stepinfo(T)