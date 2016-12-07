function H = IPgaussian(D0,M,N)

    v=0:N-1; u=0:M-1;           % offset from image origin
    cv=N/2;                     % center of (u,v) is defined as (M/2,N/2)
    cu=M/2;
    vc = v - cv;                % translate by image center
    uc = u - cu;
    [V,U] = meshgrid(vc,uc);      % create mesh of size M x N
    D = (V.^2 + U.^2);          % distance matrix (quadrated)
    Hc = exp(-D/(2*D0^2));      % compute gaussian matrix (z-value)
    H = fftshift(Hc);
    
end

