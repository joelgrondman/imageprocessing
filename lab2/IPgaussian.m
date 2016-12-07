function H = IPgaussian(D0,M,N)

    v=0:N-1;
    u=0:M-1;
    Cv=0.5*N;
    Cu=0.5*M;
    [V,U] = meshgrid(v,u);                  % create mesh of size P x Q
    Hc = exp(-((U - Cu).^2 + (V - Cv).^2)/(2*D0^2)); % centered at midpoint of grid
    H = fftshift(Hc);
    
end

