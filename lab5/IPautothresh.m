function [fb, Tn] = IPautothresh( f )

    T0=min(f(:));
    Tn = T0 + 1;
    ud = 1;
    ub = 0;

    while T0 ~= Tn
        ud=mean(f(f>T0));
        ub=mean(f(f<=T0));
        
        T0 = Tn;
        Tn = (ud + ub)/2;

    end
    
    
    fb = f>Tn;


end

