

function [min_dist,best_sol_index,path] = tsp_func(n,dist,size_pop,path)

% Main function

% Inputs:
    % Number of cities:                             n 
    % Distance matrix of cities                     dist
    % initial population:                           size_pop
    % Randomly generated path with fixed seed       path

%Calculate distance of initial path    
dist_total=zeros(size_pop,1);
for i=1:size_pop;
    dist_total(i,1)=myLength(dist,path(i,:));   
end

max_dist=max(dist_total);
min_dist=min(dist_total);

% Calculate fitness
fit = fitness(dist_total,max_dist,min_dist);

% Find index of best solution
[best_sol_index,t] =find(dist_total==min_dist);
            
% Print the path of best solution
path(best_sol_index,:)

dist_best=myLength(dist,path(best_sol_index,:))


% Generate new path
new_path = sort_path(path,dist_total,fit); % n+2 * size_pop matrix

% Keep the best performing path
path_keep =new_path(1,1:n);

% Generate the vectors used for mutation
index_mutate= index_by_prob(fit,size_pop-1) ;
path_mutate = new_path(index_mutate,2:n);
for i=1:(size_pop-1)
    path_mutate(i,:)=mutate(path_mutate(i,:));
end
path_mutate= [n* ones(size_pop-1,1),path_mutate];

% New path
path=[path_keep;path_mutate];
