
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
