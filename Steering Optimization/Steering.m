clear
syms lt alpha R P W Pl Ql Rl ls;
syms delta_r delta_l theta_r theta_l;
%LW = input("Enter Value of lw: );
%LRP = input("Enter Value of lrp: );
lw = 49;
lrp = 14;
s = 3.8;
e = 0;
u = 2;
la = 79;
r = (lw - lrp)/2;
lt = sqrt((s - ls*cosd(alpha)).^2 + (r - ls*sind(alpha)).^2);
R = lt^2 - ls^2 - r^2 - s^2 - u^2 + 2*r*u;
P = 2*ls*(u + r);
Q = 2*ls*s;
Pl = 2*ls*(r-u);
Ql = 2*ls*s;
Rl = lt^2 - ls^2 - r^2 - s^2 - u^2 + 2*r*u;
delta_r = atan(P/Q);
delta_l = atan(Pl/Ql);
theta_r = pi/2 + asin(R/sqrt(P^2 + Q^2)) + delta_r - alpha;
theta_l = - asin(Rl/sqrt(Pl^2 + Ql^2)) - delta_l + alpha - pi/2	;
eqn(alpha) = cot(theta_l) - cot(theta_r) == la/lw;
sol = vpasolve(eqn(30),ls)
z = 1;
%{
for i=20:2:30
    sol(z) = double(vpasolve(eqn(i),ls));
    z=z+1;
end

data = [x(:), sol(:)];
col_header = {'alpha','ls'};
xlswrite('Data.xlsx',col_header,'Sheet1',A1);
xlswrite('Data.xlsx',data,'Sheet1',A2);
%}
