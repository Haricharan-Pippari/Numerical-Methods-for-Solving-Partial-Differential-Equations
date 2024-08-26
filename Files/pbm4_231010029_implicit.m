function [u_imp,nt] = pbm4_231010029_implicit(xmax, nx, cfl, tmax)
x=linspace(0,xmax,nx);
dx = xmax/(nx-1);
dt =  cfl*dx;
nt = 1 + tmax/dt;

u_imp=zeros(nx,nt); 

u_imp(:,1) = sin(pi*x);

for i = 2:nx-1
    u_imp(i,2) = u_imp(i,1) + ((dt/4)*sin(2*pi*i*dx));
end

a = zeros(nx,nx);
b = zeros(nx,1);

a(1,1) = 1;
a(nx,nx) = 1;
b(1,1) = 0;
b(nx,1) = 0;

for i = 2:nx-1
    a(i,i-1) = cfl^2;
    a(i,i) = - (2*(cfl^2)) - 1;                         
    a(i,i+1) = cfl^2;
end

for it = 2:nt-1
    for i = 2:nx-1
        b(i,1) = u_imp(i,it-1)-(2*u_imp(i,it));
    end
    u_imp(:,it+1) = a\b;
end

plot(x,u_imp(:,1));
title("PROBLEM-4 _ IMPLICIT");
hold on
plot(x,u_imp(:,ceil(nt/4)))
plot(x,u_imp(:,ceil(2*nt/3)))
plot(x,u_imp(:,nt))
hold off
end