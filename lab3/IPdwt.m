function [ W ] = IPdwt( f , scale )

    fs = length(f);       %length of 1D discrete function
    H = eye(length(f));   %Haar matrix (scale 0)
    NC=1/sqrt(2);         %normalization constant 
    LP=[1 1];             %lowpass portion
    HP=[1 -1];            %highpass portion


    % iteration of H_n from H_0 
    for i = 1:scale
       s = fs/(2^i);   % s indicates up to which rows of H to update
       % compute H_i matrix
       H(1:2*s,:) = NC * [kron(eye(s),LP) ; kron(eye(s),HP)]*H(1:2*s,:); 
    end

    W=H*f'; %computes the coefficients
    W=W'; %outputs a row vector
end

