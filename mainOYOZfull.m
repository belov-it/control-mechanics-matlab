% Сначала код из controlOY, затем из controlOYOZ. Общий файл для построения
% графиков

clear

% Параметры для интегрирования
t0 = 0;  tk = 196000;
x0=0.001; dx0 = 0; y0= 10.01; dy0 = 0;  z0 = 0.05; dz0 = 0;

opt = odeset('MaxStep',100);

p.test=0;

solve = ode45(@(t,q) rp(t,q,p), [t0 tk], [x0;y0;z0;dx0;dy0;dz0]);

tResOY=solve.x; xResOY =solve.y(1,:);
yResOY =solve.y(2,:); zResOY =solve.y(3,:);

% Параметры для интегрирования
t0 = 0;  tk = 196000;
x0=0.001; dx0 = 0; y0= 10.01; dy0 = 0;  z0 = 0.05; dz0 = 0;

p.test=0;


tRes = []; zRes = []; dzRes = []; xRes = []; dxRes=[]; yRes =[]; dyRes= [];

global Fti;
Fti=0.1;

opt = odeset('Events', @(t,q) EventFnc(t,q,p), 'MaxStep',100);
% Интегрирование
N = 130; %количество включений/выключений Fti

for i = 1:N
  Fti
  solve = ode45(@(t,q) rp(t,q,p), [t0 tk], [x0;y0;z0;dx0;dy0;dz0], opt);

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

  % Добавление результатов в общий массив
  tRes = [tRes time];
  xRes = [xRes x];
  yRes = [yRes y];
  zRes = [zRes z];
  dxRes = [dxRes dx];
  dyRes = [dyRes dy];
  dzRes = [dzRes dz];

  %Обновление НУ
  t0 = solve.xe(end);
  x0 = solve.ye(end,1);
  y0 = solve.ye(end,2);
  z0 = solve.ye(end,3);
  dx0 = solve.ye(end,4);
  dy0 = solve.ye(end,5);
  dz0 = solve.ye(end,6);

  if t0 >= tk
    break
  end
end



