function fm = IPmedian(f)

    [M,N] = size(f);
    fm = nan(M,N);
    
    % for each pixel
    for m = 1:M
        for n = 1:N
            % find neighbouring pixels
            Ml = max(1,m-1); Mr = min(M,m+1); % boundaries w.r.t. M
            Nl = max(1,n-1); Nr = min(N,n+1); % boundaries w.r.t. N
            val = f(Ml:Mr,Nl:Nr);             % all neighbouring pixels
            vals = sort(val(:));              % sort neighbouring pixels
            % assign the median of the sorted pixels ot fm(m,n)
            fm(m,n) = vals(round(length(vals)/2)); 
        end
        
    end
    
    fm = uint8(fm);

end

