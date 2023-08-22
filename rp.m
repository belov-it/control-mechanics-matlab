%Функция правых частей системы ДУ

function dqdt = rp(t,Y,p)
  x = Y(1); %x
  y = Y(2); %y
  z = Y(3); %z
  dx = Y(4); %dx
  dy = Y(5); %dy
  dz = Y(6); %dz

  global Fti;
  mA = 500; mB =5000; a0 = deg2rad(10); Rs= 2; y0= 10;
  mu = 3.986004415*10^14;  Rz = 6371000; h0= 500000;

  kpx=-3; kpy =1; kvx=-4; kvy= -1;

  cosA = y/sqrt(x^2 + y^2 + z^2);
  a=acos(cosA);
  cosB = x/sqrt(x^2 + z^2);
  sinB = z/sqrt(x^2 + z^2);
  h = tan(a0);

  X = Rs/(h*sqrt(x^2 + y^2 + z^2));
  n = sqrt(mu/(Rz + h0)^3);

  nB = (1 - exp(-3*X^2/(1 - X^2*h^2)));
  fx = nB*(1 - 9*X^2*(X^2*h^4 - h^2 + 2)/(2*h^2*(1 - X^2*h^2)^3)*a^2);
  fr = (1 - nB)*(3*X^2/(1 - X^2*h^2)*a);
  nB0= 1-exp((3*Rs^2*cot(a0)^2)/(Rs^2 - y0^2));

  FBx = -Fti*fr*cosB; FBy = Fti*fx; FBz = Fti*fr*sinB;
  FAx = 0; FAy = mA/mB*nB0*Fti; FAz = 0;


  ddx = 2*n*dy+3*n^2*x+FBx/mA - FAx/mB;
  ddy = -2*n*dx+FBy/mB - FAy/mA +n^2*kpx*x+n*kvx*dx+n^2*kpy*(y- y0)+n*kvy*dy;
  ddz= -n^2*z+FBz/mB - FAz/mA;

  dqdt = [dx;dy;dz;ddx;ddy;ddz];

  end
