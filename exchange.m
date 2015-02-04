%exchange.m

% simple exchange to use for mutation

function [x,y]=exchange(x,y)
temp=x;
x=y;
y=temp;
