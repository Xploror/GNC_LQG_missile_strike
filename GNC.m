%% Defining transfer function, LQR and Kalman filter (LQG)
A = [-1.064 1.000; 290.26 0.00];
B = [-0.25; -331.40];
C = [-123.34 0; 0 1];
D = [-13.51; 0];
op_poles = eig(A);

sys = ss(A,B,C,D);
TF = tf(sys);

% LQR Section
Q = [0.1 0; 0 0.1];
R = 0.5;
[K,s,e] = lqr(A,B,Q,R);
cl_poles = eig(A-B*K);

Acl = A-B*K;
sscl = ss(Acl,B,C,D);
cl_tf = tf(sscl);

% Kalman Section
G = eye(length(A(1,:)));
H = 0*eye(length(C(1,:)));
q_bar = diag(0.000015*ones(1,length(G(1,:))));
r_bar = diag(0.001*ones(1,length(G(1,:))));
sys_noise = ss(A,[B,G],C,[D,H]);
[kest,L,P] = kalman(sys_noise, q_bar, r_bar, 0);
Aob = A-L*C;
eig(Aob);

% Variables
dT1 = 0.75;
dT2 = 0.25;
Re = 6341e3;
V = 1021.08;

%% Distance calculation and initial conditions
lat_target = 34.6588*pi/180;
long_target = -118.769745*pi/180;
elev_target = 0;

lat_init = 34.2329;
long_init = -119.4573;
elev_init = 10000;

lat_obs = 34.61916*pi/180;
long_obs = -118.8429*pi/180;
    
d_lat = lat_target - lat_init;
d_long = long_target - long_init;

azimuth_ang = azimuth(lat_init,long_init,lat_target*180/pi,long_target*180/pi);  % in degrees
