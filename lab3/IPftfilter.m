function g = IPftfilter(f,H)

    [M,N] = size(f);
    P = 2*M;
    Q = 2*N;
    
    
    fp = zeros(P,Q);
    fp(1:M,1:N) = im2double(f);        % zero padding
    
    Fp = fft2(fp); % FFT of image fp
    Fpc = fftshift(Fp);
    Gpc = Fpc .* H;       % Product of FFTs
    
    Gp = ifftshift(Gpc);
    g = ifft2(Gp);       % perform IFFT
    g = real(g);         % Take real part
    g = im2uint8(g);        % convert to uint8
    g = g(1:M,1:N);      % obtain M x N part
end

