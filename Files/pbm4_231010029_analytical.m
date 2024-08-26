function u_ana = pbm4_231010029_analytical(x, t)

u_ana = zeros(length(x),length(t));

for j = 1:4
    for i = 1:length(x)
        u_ana(i,j) = sin(pi.*x(i))*(cos(pi*t(j)) + ((1/(8*pi)) * sin(2*pi.*x(i)) * sin(2*pi*t(j))));
    end
end

plot(x,u_ana(:,1))
hold on
plot(x,u_ana(:,2))
plot(x,u_ana(:,3))
plot(x,u_ana(:,4))
title("PROBLEM-4 _ ANALYTICAL");
hold off

end