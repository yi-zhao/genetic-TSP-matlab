
%Main Script TSP
%By Yi Zhao

%Solve the problem with simplied generic algorithm
%Keep the best performing path, and then generate a series of new path
    %based on the fitness of old pathes, and then mutate them

% Results: with a 1500 initial population, 20 cities, total length->
    % With fixed random seed->
    % Simple 1-time simulation     = 72.1732
    % Run the function 10 times    = 62.9781
    % Run the function 100 times   = 46.7867
    % Run the function 200 times   = 39.7885
 
% Take ~29 secs to run the loop 200 times with my macbook air


% Function list:
% tsp_func.m --- the main function
% myLength.m --- to calculate length of path
% fitness.m --- to evaulate goodness of each path
% exchange.m --- to exchange cities in 2 paths
% mutate.m --- for mutation
% sort_path --- to sort the path by its fitness to keep top performer
% index_by_prob.m --- generate new vector based on old path and probality
% defined by fitness



clc;
clear all;


% Ask for user input as number of cities
prompt = 'What is the number of cities in this TSP program? ';
n = input(prompt)


% Generate location matrix
rand('seed',10000)
loc_matrix = 10* rand(2,n);

% Calculate distance matrix
dist = zeros(n);
for i=1:n;
    for j=1:n;
        
        dist(i,j)= dist(i,j)+ sqrt( (loc_matrix(1,i)-loc_matrix(1,j))^2 + (loc_matrix(2,i)-loc_matrix(2,j))^2  );
    end
end


% Number of initial random population
    % set initial population as 1500
    
size_pop = 1500;

% generate random path

path = zeros(size_pop, n);
path(:,1)= n* ones(size_pop,1);

for i=1:size_pop,
    path(i,2:end)=path(i,2:end)+randperm(n-1);
end


tic


% Loop for 200 times
for i=1:200,    
%    [min_dist,best_sol_index,path] = tsp_func(n,dist,size_pop,path);
    [min_dist,best_sol_index,path] = tsp_func(n,dist,size_pop,path)

    i=i+1;
    min_dist
    %path(best_sol_index,:);
end



toc
