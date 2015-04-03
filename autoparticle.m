% Automatically generate different CSV files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
tic

% (1) DEFAULT SETTINGS
% (change if necessary, but note that
%  these are only DEFAULTS, not what
%  will be varied!)
tend=2e-4;
%r0=[-4.846423370044622, -1.179987342959452e-1, -8.140413883020006e-1];
r0=[8, 0, -1];
v0=[-9.5487e6, -7.7664e6, -4.1652e6];
magnetic_field='../ode-solver/tests/iter2d.bkg';
domain_file='../ode-solver/tests/iter.wall_2d';
mass=40;
charge=9;

% (2) EXEC LINE
% Uncomment all lines but the line specifying the
% parameter you want to vary. Comment that one out!
execline='../ode-solver/solver';
execline=[execline ' -c ',num2str(charge)];		% Charge
execline=[execline ' -d ',domain_file];			% Domain file
execline=[execline ' -f ',magnetic_field];		% Magnetic field file
execline=[execline ' -m ',num2str(mass)];	    % Mass
%execline=[execline ' -r ',num2str(r0(1)),',',num2str(r0(2)),',',num2str(r0(3))];
%execline=[execline ' -v ',num2str(v0(1)),',',num2str(v0(2)),',',num2str(v0(3))];
execline=[execline ' -t ',num2str(tend)];		% End time
execline=[execline ' -p'];						% Output run details to file

% Run 'solver'
i=1;
vx=-9.5487e6;
vy=-7.7664e6;
vz=-4.1652e6;
sims=100;
velocities=linspace(-5.3243e6,-5.325e6,sims);

for vx=velocities
	% Generate start point for new particle
	nexc=[execline ' -v ',num2str(vx),',',num2str(vy),',',num2str(vz)];
	nexc=[nexc ' -o sims/particle',num2str(i),'.csv'];
	system(nexc);

	i=i+1;
end

xi=zeros(1,sims);
v=zeros(1,sims);
for i=1:sims
	xi = [xi findxi(['sims/particle',num2str(i),'.csv'])];
	v =  [v  norm([velocities(i) vy vz])];
end

plot(v,xi,'linewidth', 3);

% Load, plot and save to file.
%data = dlmread('particle.csv', ',', 9, 0);

%t=data(:,1);
%x=data(:,2);
%y=data(:,3);
%z=data(:,4);
%E=data(:,8);

%plot3(x,y,z);
%plot(t,E);

toc
