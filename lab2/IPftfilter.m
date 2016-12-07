function g = IPftfilter(f,H)


    F = fft2(double(f)); % FFT of image fp
    Gp = F .* H;       % Product of FFTs

        %uncomment to save centered filtered result in frequency domain
        %Fs = abs(fftshift(Gp));

        % contrast stretch
        %M = max(Fs(:));
        %m = min(Fs(:));
        %Fscs = (256/(M-m))*(Fs-m);
        %Fscsi = im2uint8(Fscs);
        %imwrite(Fscsi,'charactersspectrumfilteredcentered.png')
    
    g = ifft2(Gp);       % perform IFFT
    g = real(g);         % Take real part
    g = uint8(g);        % convert to uint8

end

