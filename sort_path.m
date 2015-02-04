%sort_path.m

% to sort the path by its fitness, so can directly select the top performing path to
% directly keep

function path_ranked = sort_path(path, dist_total,fit)


[t,tt]=size(path);

temp_path=[ path,dist_total];

temp_path = sortrows(temp_path, tt+1);

path_ranked=temp_path;
