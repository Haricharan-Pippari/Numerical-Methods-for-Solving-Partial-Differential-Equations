function pbm2_231010029_laxfriedrichs(u, k, nt, nx, c, xmax, tmax)
% LAX-FRIEDRICHS

x=linspace(0,xmax,nx);
dx = xmax/(nx-1);
dt =  tmax/(nt-1);

u(:,1) = sin(k * x);

plot(x,u(:,1),'--');

hold on
for it = 1:nt-1
    for i=2:nx-1
        u(i,it+1) = (0.5*(u(i+1,it)+u(i-1,it))) - (c*dt*((u(i+1,it) - u(i-1,it))/(2*dx)));
    end
end

plot(x,u(:,nt));
x1 = linspace(1.5,4,nx);
u_theo= sin(k*x1 - 1.5*(1-c));
plot(x1,u_theo,"-.",Color='k');
legend("INITIAL","LAX-FRIEDRICHS SCHEME","THEORITICAL");
hold off
end