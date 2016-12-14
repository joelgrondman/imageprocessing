function [ f ] = IPidwt( W , scale )


H=[1];                %Haar wavelet for H_1 
NC=1/sqrt(2);         %normalization constant 
LP=[1 1];             %lowpass portion
HP=[1 -1];            %highpass portion

% iteration of H_n from H=[1]
for i=1:scale
    H=NC*[kron(H,LP);kron(eye(size(H)),HP)];                                                 
end

f=inv(H)*W'; %computes the original values
f=f'; %outputs row vector
end

