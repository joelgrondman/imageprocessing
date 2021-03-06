function X = IPrecon_by_dilation(f,mask,se)

    X = f;
    Xo = 0;
    
    while sum(sum(X ~= Xo)) > 0
        
        Xo = X;
        X = IPdilate(X,se) == mask;
    
    end
    


end

