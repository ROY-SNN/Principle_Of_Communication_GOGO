function [out] = noise_nb(fc,B,N0,t)
%output the narrow band gaussian noise sample with single-sided power spectrum N0
%at carrier frequency equals fc and bandwidth euqals B
dt = t(2)-t(1);
Fmx = 1/dt;
n_len = length(t);
p = N0*Fmx;
rn = sqrt(p)*randn(1,n_len);
[f,rf] = T2F(t,rn)
[t,out] = bpf(f,rf,fc-B/2,fc+B/2);