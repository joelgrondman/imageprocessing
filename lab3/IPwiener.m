function g = IPwiener(f,H)

    F = fft2(double(f));
    Fr = ((conj(H)./((conj(H).*H + 0.01)))) .* F; % apply Wiener filter
    
    g = ifft2(Fr);       % perform IFFT
    g = real(g);         % Take real part
    g = uint8(g);        % convert to uint8


end

