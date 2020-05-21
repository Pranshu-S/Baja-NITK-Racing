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
lt_cal(ls,s) = sqrt((s - ls*cos(alpha)).^2 + (r - ls*sin(alpha)).^2);
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
s_add = 5;
s_end = 245.161;
ls_add = 5;
ls_end = 105;
e(ls, s) = x_l - x_r;
j=initial_s:s_add:s_end;
T = table(0,0,0,0);
newT = table();
for i=initial_ls:ls_add:ls_end
    for j=initial_s:s_add:s_end
        clear lt_val;
        clear es;
        lt_val = lt_cal(i,j);
        es = double(e(i,j));
        clear newT;
        newT = table(double(i),double(j),double(es),double(lt_val));
        T = [T; newT];
    end
end

T.Properties.VariableNames = {'ls','s','error','lt'};
writetable(T,'Data3.xlsx','Sheet',1);



        

        
        
        

        