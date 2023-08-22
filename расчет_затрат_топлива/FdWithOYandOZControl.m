%Расчет силы, действующей на сферу

mA = 500; mB =5000; a0 = deg2rad(10); Rs= 2; y0= 10;
mu = 3.986004415*10^14;  Rz = 6371000; h0= 500000;

cosA = yRes./sqrt(xRes.^2 + yRes.^2 + zRes.^2);
a=acos(cosA);
cosB = xRes./sqrt(xRes.^2 + zRes.^2);
sinB = zRes./sqrt(xRes.^2 + zRes.^2);
h = tan(a0);

X = Rs./(h*sqrt(xRes.^2 + yRes.^2 + zRes.^2));
n = sqrt(mu/(Rz + h0)^3);

nB = (1 - exp(-3*X.^2/(1 - X.^2*h^2)));
fx = nB.*(1 .- 9.*X.^2.*(X.^2.*h^4 - h.^2 + 2)/(2.*h.^2*(1 - X.^2.*h^2).^3).*a.^2);
fr = (1 - nB).*(3.*X.^2/(1 - X.^2*h^2).*a);
nB0= 1-exp((3*Rs^2*cot(a0)^2)/(Rs^2 - y0^2));

Fti = 0.1;
FBx = -Fti.*fr.*cosB; FBy = Fti.*fx; FBz = Fti.*fr.*sinB;

FdNo = sqrt(FBx.^2.+FBy.^2.+FBz.^2);

