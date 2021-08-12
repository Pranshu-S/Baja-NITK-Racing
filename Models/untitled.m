syms t x
g = @(t,x)[-x(1)+a*x(3);-x(2)+2*x(3);x(1)^2-2*x(3)]
for a = 0:2
[t,xa] = ode45(@(t,x) g(t,x,a),[0 1.5],[1 1/2 3]);
figure
plot(t,xa(:,2))
title(['y(t) for a=',num2str(a)'])
end
