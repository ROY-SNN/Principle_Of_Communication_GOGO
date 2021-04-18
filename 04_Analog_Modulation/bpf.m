function [t,st]=bpf(f,sf,B1,B2)
%This function filter an input at frequency domain by an ideal bandpass filter
%Inputs:
%     f:  frequency samples
%     sf: input data spectrum samples
%     B1: bandpass's lower frequency
%     B2: bandpass's higher frequency 
%Outputs:
%     t: frequency samples
%     st: output data's time samples
df = f(2)-f(1);
T = 1/df;
hf = zeros(1,length(f));
	 
bf = [floor( B1/df ): floor( B2/df )] ;
bf1 = floor( length(f)/2 ) + bf;
bf2 = floor( length(f)/2 ) - bf;
hf(bf1)=1/sqrt(2*(B2-B1));
hf(bf2)=1/sqrt(2*(B2-B1));
 	
yf=hf.*sf.*exp(-j*2*pi*f*0.1*T);
[t,st]=F2T(f,yf);