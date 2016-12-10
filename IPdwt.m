function [ X ] = IPdwt( f , scale )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
%Initialization 
H=[1];                %Haar wavelet for H_1 
NC=1/sqrt(2);         %normalization constant 
LP=[1 1];             %lowpass portion
HP=[1 -1];            %highpass portion
N=log2(size(f,2));    %N represents lenth of the input function by the power of two
%instead we can just replace N with scale?


% iteration of H_n from H=[1] 
%the Haar matrix can be derived from the kronecker product (kron function) of H_n by [1,1]
%in the first row and the kronecker product of I_n by [1,-1]

for i=1:N
    H=NC*[kron(H,LP);kron(eye(size(H)),HP)];                                                 
end

X=H*f'; %computes the coefficients
X=X';
end

