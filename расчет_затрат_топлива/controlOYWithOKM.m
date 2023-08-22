% Интегрирование полной системы без управления по Oz. В плоскости орбиты
% управление только по оси Oy

%clear

% Параметры для интегрирования
t0 = 0;  tk = 138*86000;
x0=0.001; dx0 = 0; y0= 10.01; dy0 = 0;  z0 = 0.05; dz0 = 0;

p.mu = 3.986004415*10^14; %гравитационная
p.Rz = 6371000; %радиус земли
p.h = 500000; %высота
n = sqrt(p.mu/(p.Rz+p.h)^3);

r0=p.Rz+p.h; nu0=0; dr0=0; dnu0=n;

opt = odeset('MaxStep',100);

p.test=0;

solve = ode45(@(t,q) rpWithOKM(t,q,p), [t0 tk], [x0;y0;z0;dx0;dy0;dz0;r0; nu0; dr0; dnu0]);

tResN=solve.x; xRes =solve.y(1,:); yRes =solve.y(2,:); zRes =solve.y(3,:);
dxRes =solve.y(4,:); dyRes =solve.y(5,:); dzRes =solve.y(6,:);

rResNo = solve.y(7,:);
hResNo=rResNo-p.Rz;

kpx=-3; kpy =1; kvx=-4; kvy= -1;

