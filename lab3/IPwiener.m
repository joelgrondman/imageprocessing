function g = IPwiener(f,H)

    F = fft2(double(f));
    
    Fr = ((1./(H)).*abs(H)/(abs(H) + 1)) * F;
    
    g = ifft2(Fr);       % perform IFFT
    g = real(g);         % Take real part
    g = uint8(g);        % convert to uint8


end

