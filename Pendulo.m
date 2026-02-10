function dx = Pendulo(~,y,z)

xc = y(1);
xcd = y(2);
a = y(3);
ad = y(4);

Ip  = z(1);
Mc  = z(2);
lp  = z(3);
Mp  = z(4);
Fc  = z(5);
Beq = z(6);
Bp  = z(7);
g   = z(8);

den = (Mc + Mp)*Ip + Mc*Mp*lp^2 + Mp^2*lp^2*sin(a)^2;

xdd = ( ...
    (Ip + Mp*lp^2)*Fc ...
  + Mp^2*lp^2*g*cos(a)*sin(a) ...
  - (Ip + Mp*lp^2)*Beq*xcd ...
  - (Ip*Mp*lp + Mp^2*lp^3)*ad^2*sin(a) ...
  - Mp*lp*a*cos(a)*Bp ...
  ) / den;

add = ( ...
    (Mc + Mp)*Mp*g*lp*sin(a) ...
  - (Mc + Mp)*Bp*ad ...
  + Fc*Mp*lp*cos(a) ...
  - Mp^2*lp^2*ad^2*sin(a)*cos(a) ...
  - Beq*Mp*lp*xcd*cos(a) ...
  ) / den;

dx = zeros(4,1);
dx(1) = xcd;
dx(2) = xdd;
dx(3) = ad;
dx(4) = add;
end