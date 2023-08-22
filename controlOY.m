% Интегрирование полной системы без управления по Oz. В плоскости орбиты
% управление только по оси Oy

clear

% Параметры для интегрирования
t0 = 0;  tk = 196000;
x0=0.001; dx0 = 0; y0= 10.01; dy0 = 0;  z0 = 0.05; dz0 = 0;

opt = odeset('MaxStep',100);

p.test=0;

solve = ode45(@(t,q) rp(t,q,p), [t0 tk], [x0;y0;z0;dx0;dy0;dz0]);

tRes=solve.x; xRes =solve.y(1,:); yRes =solve.y(2,:); zRes =solve.y(3,:);


