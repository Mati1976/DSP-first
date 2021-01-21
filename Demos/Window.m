% A small script to show  the difference between the bartlett and the triangular windows 
clear all;
close all;
L = 64;
bw = triang(L);
wvtool(bw)

bw = bartlett(L);
wvtool(bw)