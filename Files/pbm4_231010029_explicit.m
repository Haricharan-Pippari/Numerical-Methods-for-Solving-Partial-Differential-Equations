function [u_exp,nt] = pbm4_231010029_explicit(xmax, nx, cfl, tmax)
x=linspace(0,xmax,nx);
dx = xmax/(nx-1);
dt =  cfl*dx;
nt = 1 + tmax/dt;
u_exp=zeros(nx,nt);

u_exp(:,1) = sin(pi*x);

for i = 2:nx-1
    u_exp(i,2) = u_exp(i,1) + ((dt/4)*sin(2*pi*i*dx));
end

for it = 2:nt-1
    for i = 2:nx-1
        u_exp(i,it+1) = 2*u_exp(i,it) - u_exp(i,it-1) + ((cfl^2) * (u_exp(i-1,it) - (2*u_exp(i,it)) + u_exp(i+1,it)));
    end 
end

plot(x,u_exp(:,1));
title("PROBLEM-4 _ EXPLICIT");
hold on
plot(x,u_exp(:,ceil(nt/4)))
plot(x,u_exp(:,ceil(2*nt/3)))
plot(x,u_exp(:,nt))
hold off
end