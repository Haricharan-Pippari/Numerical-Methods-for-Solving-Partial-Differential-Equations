clear;
clc;
close all;

%%  PROBLEM - 1
nx = 64;
xmax = 1;

nt = 64;
tmax = 0.05;

nu = 0.501;

[u, x] = pbm1_231010029(nx, nt, xmax, tmax, nu);
plot(x,u(:,[1 ceil(nt/5) nt]));
title("For nt = 64, nu = 0.501");
figure;

% If t is doubled
[u, x] = pbm1_231010029(nx, nt/2, xmax, tmax, nu);
plot(x,u(:,[1 ceil(nt/10) nt/2]));
title("For nt = 32, nu = 0.501");
figure;

nu = 0.14;
nt  = 64;

% If we modify nu = 0.14
[u, x] = pbm1_231010029(nx, nt, xmax, tmax, nu);
plot(x,u(:,[1 ceil(nt/5) nt]));
title("For nt = 64, nu = 0.14");
figure;

% If t is doubled
[u, x] = pbm1_231010029(nx, nt/2, xmax, tmax, nu);
plot(x,u(:,[1 ceil(nt/10) nt/2]));
title("For nt = 32, nu = 0.14");
figure;

%%  PROBLEM - 2

nx = 2001;
xmax = 4;

nt = 1001;
tmax = 1.5;

u=zeros(nx,nt); 

c = 1;
k = 4*pi;

pbm2_231010029_upwind(u, k, nt, nx, c, xmax, tmax);
title("UPWIND");
figure;
pbm2_231010029_laxfriedrichs(u, k, nt, nx, c, xmax, tmax);
title("LAX-FRIEDRICHS");
figure;
pbm2_231010029_laxwendroff(u, k, nt, nx, c, xmax, tmax);
title("LAX-WENDROFF");
figure;

%%  PROBLEM - 3

%   RICHTMYER

nx = 401;
xmax = 4;
nt = 501;
tmax = 0.5;
nu = 0.001;

[u,x] = pbm3_231010029_richtmyer(nx, xmax, tmax, nt, nu);

plot(x,u(:,1))
title("RICHTMYER");
hold on
plot(x,u(:,nt))
hold off
figure;

%   MACCORMACK

nx = 401;
xmax = 4;
nt = 501;
tmax = 0.5;
nu = 0.01;

[u,x] = pbm3_231010029_maccormack(nx, nt, nu, tmax, xmax);
plot(x,u(:,1))
title("MACCORMACK");
hold on
plot(x,u(:,nt))
hold off
figure;

%%  PROBLEM - 4

%   ANALYTICAL

x = linspace(0,1,51);
t = [0 0.4 0.8 1.2];

u_ana = pbm4_231010029_analytical(x, t);
figure;

%   EXPLICIT

nx = 51;
xmax = 1;
cfl = 0.5;
tmax = 1.2;

[u_exp,nt] = pbm4_231010029_explicit(xmax, nx, cfl, tmax);
figure;
plot(x, u_exp(:,ceil(nt/4)) - u_ana(:,2));
title("Error plot for Explicit (@t=0.4s)");
figure;
plot(x,u_exp(:,ceil(2*nt/3)) - u_ana(:,3));
title("Error plot for Explicit (@t=0.8s)");
figure;
plot(x,u_exp(:,nt) - u_ana(:,4));
title("Error plot for Explicit (@t=1.2s)");
figure;

%   IMPLICIT

nx = 51;
xmax = 1;
cfl = 0.5;
tmax = 1.2;

[u_imp,nt] = pbm4_231010029_implicit(xmax, nx, cfl, tmax);

plot(x, u_imp(:,ceil(nt/4)) - u_ana(:,2));
title("Error plot for Implicit (@t=0.4s)");
hold on
plot(x,u_imp(:,ceil(2*nt/3)) - u_ana(:,3));
title("Error plot for Implicit (@t=0.8s)");
plot(x,u_imp(:,nt) - u_ana(:,4));
title("Error plot for Implicit (@t=1.2s)");
hold off

