
a = 0.825; %distance of front axle from CG (m)
b = 0.675; %distance of rear axle from CG (m)
L = 1.5; %wheel base (m)
Cf = 4.217814761309471e+03; %front cornering stiffness (N/rad)
Cr = 7.016673322054953e+03; %rear cornering stiffness (N/rad)
m = 230; %mass of car (kg)
ucrit = sqrt((Cf*Cr*(L*L))/(m*(b*Cr - a*Cf))); %critical velocity
u = 0:5:230.4054 ; %forward velocity of car (m/s)
delta = 0:0.01136255:0.52359878; %steering angle
R = L./delta; %turning radius
alphaf = ((m*(u.^2))./R)*(a/(L*Cf)); %front slip angle
alphar = ((m*(u.^2))./R)*(b/(L*Cr)); %rear slip angle
Fyf = Cf*alphaf; %front lateral force
Fyr = Cr*alphar; %rear lateral force
K = ((b*Cr - a*Cf)/(Cf*Cr))*m/L; 
omega = a*Fyf - b*Fyr; %yaw moment
