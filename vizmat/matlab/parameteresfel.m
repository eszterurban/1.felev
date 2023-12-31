clear
syms u v
R = 2; r =1;
x(u,v)=(R+r*cos(v))*cos(u);
y(u,v)=(R+r*cos(v))*sin(u);
z(u,v)=r*sin(v);
fsurf(x,y,z,[0 2*pi 0 2*pi],'r')
axis equal
u0=pi / 2; v0=  pi/4;
P=[x(u0,v0), y(u0,v0) ,z(u0,v0)];
hold on
plot3(P(1), P(2), P(3), 'r*', 'MarkerSize', 10)
cx(u)=x(u, v0);
cy(u)=y(u, v0);
cz(u)=z(u, v0);
fplot3(cx, cy,cz, 'b', 'LineWidth', 3)
dx= x(u0, v);
dy= y(u0, v);
dz= z(u0, v);
fplot3(dx, dy,dz, 'g', 'LineWidth', 3)
cxd(u)=diff(cx, u);
cyd(u)=diff(cy, u);
czd(u)=diff(cz, u);
a=[cxd(u0), cyd(u0),czd(u0)];
quiver3(P(1),P(2),P(3),a(1),a(2),a(3), 'y', 'LineWidth', 2)
dxd(v)=diff(dx, v);
dyd(v)=diff(dy, v);
dzd(v)=diff(dz, v);
b=[dxd(v0), dyd(v0),dzd(v0)];
quiver3(P(1),P(2),P(3),b(1),b(2),b(3), 'm', 'LineWidth', 2)
n = cross (a,b);
quiver3(P(1),P(2),P(3),n(1),n(2),n(3), 'r', 'LineWidth', 2)