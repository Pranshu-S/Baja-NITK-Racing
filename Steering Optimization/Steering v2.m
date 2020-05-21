clear
clc
syms ls s;
lw = 1490.98;
la = 1500;
initial_ls = 70;
lrp = 331.2;
alphad = 26.424;
alpha = alphad*pi/180;
initial_s = 50;
u = 44;
r = (lw -lrp)/2;
lt = sqrt((s - ls*cos(alpha)).^2 + (r - ls*sin(alpha)).^2);
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
x_l = la/tan(theta_l);
x_r = (la+lw*tan(theta_r))/tan(theta_r);
s_add = 10;
s_end = 245.161;
ls_add = 5;
ls_end = 105;
e(ls, s) = x_l - x_r;
x = 1;
y = 1;

j=initial_s:s_add:s_end;
mainT = table();
for i=initial_ls:ls_add:ls_end
    clear es;
    es = 0;
    for j=initial_s:s_add:s_end
        es = [es, double(e(i,j))];
    end
    clear T;
    j =initial_s:s_add:s_end;
    k = ones(1, length(j));
    k= k.*i;
    newT0 = table(double(j));
    newT1 = table(double(k));
    newT2 = table(double(es));
    T = table(newT0, newT1, newT2);
    mainT = [mainT; T];
    
end



        

        
        
        

        