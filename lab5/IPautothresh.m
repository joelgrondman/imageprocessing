function [fb, T1] = IPautothresh(f)

    T0=min(f(:));           %starting threshold, 
                            %interpreted as previous found threshold
    T1 = T0 + 1;            %T1 is interpreted as new threshold

    %iterate until threshold does not change anymore
    while T0 ~= T1
        m1=mean(f(f<=T0));      %mean of all pixel values below threshold
        m2=mean(f(f>T0));       %mean of all pixel values above threshold
        
        T0 = T1;                %update previous threshold to current one
        T1 = (m1 + m2)/2;       %update new threshold

    end
    
    fb = f > T1;                %return logical matrix which is the
                                %segmented result

end

