function X = IPrecon_by_dilation(f,mask,se)

    X = f;
    Xo = 0;
    
    mask = mask*2 - 1;          % change 0's to -1's
    
    while sum(sum(X ~= Xo)) > 0
        
        Xo = X;
        X = IPdilate(X,se) == mask;
    
    end

end

