% myLength.m

% function to calculate length of a given path

    function dist_total = myLength(dist,path)
    
    dist_total=zeros(1);
    
    [m,mm]=size(dist);
    
    
    dist_total=dist(path(1,m),path(1,1));
    
    for i=1:(m-1)
        dist_total=dist_total+dist(path(1,i),path(1,i+1));
    end
    
    
    
    
    
% fitness.m

%To evaluate how good each path is

function fit = fitness(dist_total,max_dist,min_dist)

fit = zeros(length(dist_total),1);

for i=1:length(dist_total);
    fit(i,1)=(max_dist - dist_total(i,1)+0.000001) / (max_dist-min_dist+0.00000001);
end






%exchange.m

% simple exchange to use for mutation

function [x,y]=exchange(x,y)
temp=x;
x=y;
y=temp;





%mutate.m

% mutation, randomly choose 2 in the path and exchange them

function a=mutate(a)
L=length(a);
rray=randperm(L);
[a(rray(1)),a(rray(2))]=exchange(a(rray(1)),a(rray(2)));




%sort_path.m

% to sort the path by its fitness, so can directly select the top performing path to
% directly keep

function path_ranked = sort_path(path, dist_total,fit)
[t,tt]=size(path);
temp_path=[ path,dist_total];
temp_path = sortrows(temp_path, tt+1);
path_ranked=temp_path;




%index_by_prob.m

function e = index_by_prob(p,n)

% Reference: https://www.mathworks.com/matlabcentral/newsreader/view_thread/244719
% Generate random number from definite probility


% p is the fitness probility vector
% n is the number of the index we want for new pathes

p = p/sum(p); 

x = rand(n,1);
y = cumsum(p);
t = size(p,1);
q = ones(size(x));
e = t*q;
for k = 1:ceil(log2(t))
 c = floor((q+e)/2);
 t = x > y(c);
 q = q + t.*(c-q);
 e = c + t.*(e-c); 
end

