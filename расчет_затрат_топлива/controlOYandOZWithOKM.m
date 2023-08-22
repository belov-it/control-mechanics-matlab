% Интегрирование системы с управленим по Oz (переключение Fti в цикле)
% в плоскости орбиты управление только по оси Oy

clear

% Параметры для интегрирования
t0 = 0;  tk = 4*86000;
x0=0.001; dx0 = 0; y0= 10.01; dy0 = 0;  z0 = 0.05; dz0 = 0;

p.mu = 3.986004415*10^14; %гравитационная
p.Rz = 6371000; %радиус земли
p.h = 500000; %высота
n = sqrt(p.mu/(p.Rz+p.h)^3);

r0=p.Rz+p.h; nu0=0; dr0=0; dnu0=n;

p.test=0;


tRes = []; zRes = []; dzRes = []; xRes = []; dxRes=[]; yRes =[]; dyRes= [];
rRes = []; nuRes = []; drRes =[]; dnuRes = []; hRes = [];

global Fti;
Fti=0.1;

opt = odeset('Events', @(t,q) EventFnc(t,q,p), 'MaxStep',100);
% Интегрирование
N = 200; %количество включений/выключений Fti

for i = 1:N
  Fti
  solve = ode45(@(t,q) rpWithOKM(t,q,p), [t0 tk], [x0;y0;z0;dx0;dy0;dz0;r0; nu0; dr0; dnu0], opt);

  if Fti == 0.1
    Fti = 0;

  elseif Fti == 0
    Fti = 0.1;

  end

  % Результаты интегрирования с текущей итерации
  time = solve.x;
  x = solve.y(1,:);
  y = solve.y(2,:);
  z = solve.y(3,:);
  dx = solve.y(4,:);
  dy = solve.y(5,:);
  dz = solve.y(6,:);
  r = solve.y(7,:);
  nu= solve.y(8,:);
  dr = solve.y(9,:);
  dnu = solve.y(10,:);

  % Добавление результатов в общий массив
  tRes = [tRes time];
  xRes = [xRes x];
  yRes = [yRes y];
  zRes = [zRes z];
  dxRes = [dxRes dx];
  dyRes = [dyRes dy];
  dzRes = [dzRes dz];
  rRes = [rRes r];
  hRes = [hRes r-p.Rz];

  %Обновление НУ
  t0 = solve.xe(end);
  x0 = solve.ye(end,1);
  y0 = solve.ye(end,2);
  z0 = solve.ye(end,3);
  dx0 = solve.ye(end,4);
  dy0 = solve.ye(end,5);
  dz0 = solve.ye(end,6);
  r0=solve.ye(end,7);
  nu0=solve.ye(end,8);
  dr0= solve.ye(end,9);
  dnu0= solve.ye(end,10);


  if t0 >= tk
    break
  end
end

%После демпфирования интегируем до 100 км
opt = odeset('Events', @(t,q) EventFncH(t,q,p), 'MaxStep',100);
tk = 140*86400;
solve = ode45(@(t,q) rpWithOKM(t,q,p), [t0 tk], [x0;y0;z0;dx0;dy0;dz0;r0; nu0; dr0; dnu0], opt);
  time = solve.x;
  x = solve.y(1,:);
  y = solve.y(2,:);
  z = solve.y(3,:);
  dx = solve.y(4,:);
  dy = solve.y(5,:);
  dz = solve.y(6,:);
  r = solve.y(7,:);
  nu= solve.y(8,:);
  dr = solve.y(9,:);
  dnu = solve.y(10,:);

  % Добавление результатов в общий массив
  tRes = [tRes time];
  xRes = [xRes x];
  yRes = [yRes y];
  zRes = [zRes z];
  dxRes = [dxRes dx];
  dyRes = [dyRes dy];
  dzRes = [dzRes dz];
  rRes = [rRes r];
  hRes = [hRes r-p.Rz];
