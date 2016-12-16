function g = IPwiener(f,H)

    Hi = ((conj(H)./((conj(H).*H + 0.01)))); % apply Wiener filter
    
    g = IPftfilter(f,Hi);

end

