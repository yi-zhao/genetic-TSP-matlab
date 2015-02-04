% myLength.m

% function to calculate length of a given path

    function dist_total = myLength(dist,path)
    
    dist_total=zeros(1);
    
    [m,mm]=size(dist);
    
    
    dist_total=dist(path(1,m),path(1,1));
    
    for i=1:(m-1)
        dist_total=dist_total+dist(path(1,i),path(1,i+1));
    end
