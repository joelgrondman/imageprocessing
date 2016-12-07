function fm = IPmedian(f)

    [M,N] = size(f);
    fm = nan(M,N);
    
    for m = 1:M
        for n = 1:N
            val = f(max(1,m - 1):min(M,m + 1),max(1,n - 1):min(N,n + 1));
            vals = sort(val(:));
            fm(m,n) = vals(round(length(vals)/2));
        end
        
    end

    fm = uint8(fm);

end

