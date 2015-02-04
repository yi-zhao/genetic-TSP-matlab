% fitness.m

%To evaluate how good each path is

function fit = fitness(dist_total,max_dist,min_dist)

fit = zeros(length(dist_total),1);

for i=1:length(dist_total);
    fit(i,1)=(max_dist - dist_total(i,1)+0.000001) / (max_dist-min_dist+0.00000001);
end
