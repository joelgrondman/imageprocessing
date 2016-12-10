function g = IPwiener(f,H)

    F = fft2(double(f));
    
    Hns = conj(H).*H;
    Fr = ((conj(H)./((Hns + 0.01)))) .* F;
    
    g = ifft2(Fr);       % perform IFFT
    g = real(g);         % Take real part
    g = uint8(g);        % convert to uint8


end

