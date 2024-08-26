function [u,x] = pbm3_231010029_richtmyer(nx, xmax, tmax, nt, nu)

x=linspace(0,xmax,nx);
dx = xmax/(nx-1);
dt =  tmax/(nt-1);

u=zeros(nx,nt); 

cfl = (nu*dt)/(dx^2);

for i=1:nx
    if (x(i) < 2)
        u(i,1) = 0;
    else
        u(i,1) = 1;
    end
end

utemp(1) = 0;
utemp(nx) = 1;
for it = 2:nt
    for i = 2:nx-1       
        utemp(i) = 0.5*(u(i,it-1)+u(i-1,it-1)) - ((u(i,it-1)*dt/(4*dx))*(u(i+1,it-1)-u(i-1,it-1))) + ((cfl/2)*(u(i+1,it-1)-(2*u(i,it-1))+u(i-1,it-1)));
    end
    
    for i = 2:nx-1
        u(i,it) = u(i,it-1) - ((u(i,it-1) * dt/(2*dx))*(utemp(i+1)-utemp(i-1))) + ((2*cfl)*(utemp(i+1) - (2*utemp(i)) + utemp(i-1)));
    end
end

u(nx,:) = 1;
end