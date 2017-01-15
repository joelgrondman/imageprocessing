function [fb, T1] = IPautothresh(f)

    T0=min(f(:));
    T1 = T0 + 1;

    while T0 ~= T1
        ud=mean(f(f>T0));
        ub=mean(f(f<=T0));
        
        T0 = T1;
        T1 = (ud + ub)/2;

    end
    
    fb = f > T1;

end

