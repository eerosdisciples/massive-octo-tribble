function y=plotxi(sims)

xi=zeros(1,sims);
v=zeros(1,sims);

for i=1:sims
	[x,u,r1,r2] = findxi(['sims/particle',num2str(i),'.csv']);
	xi = [xi x];
	v  = [v  u];
end

plot(v,xi,'linewidth', 3);
