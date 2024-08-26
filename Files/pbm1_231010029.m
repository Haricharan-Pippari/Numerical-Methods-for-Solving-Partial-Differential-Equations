function [u, x] = pbm1_231010029(nx, nt, xmax, tmax, nu)

x=linspace(0,xmax,nx);
dx = xmax/(nx-1);

dt =  tmax/(nt-1);

u=zeros(nx,nt); 

for i=1:nx
    if (x(i) >= 0.4)  && (x(i) <= 0.6)
        u(i,1) = 1;
    else
        u(i,1) = 0;
    end
end

for it = 1:nt-1
    for i=2:nx-1
        u(i,it+1) = u(i,it) + nu*dt*((u(i+1,it) - 2*u(i,it) + u(i-1,it))/dx^2);
    end
end
end