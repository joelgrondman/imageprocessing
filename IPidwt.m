function [ f ] = IPidwt( X,scale )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Initialization 
H=[1];                %Haar wavelet for H_1 
NC=1/sqrt(2);         %normalization constant 
LP=[1 1];             %lowpass portion
HP=[1 -1];            %highpass portion
N=log2(size(X,2));    %N represents lenth of the input function by the power of two
%instead we can just replace N with scale?

for i=1:N
    H=NC*[kron(H,LP);kron(eye(size(H)),HP)];                                                 
end

f=inv(H)*X'; %computes the original values
f=f';
end

