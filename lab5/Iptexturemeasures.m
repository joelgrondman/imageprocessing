function [m, u2, R, u3, U, e] = IPtexturemeasures(f)

    p=histcounts(f,-0.5:255.5,'Normalization', 'probability');
    figure(4)
    plot(0:255,p)
    m=sum((0:255).*p);                          %compute mean
    u2 = sum((((0:255) - m).^2).*p);            %compute variance

    u2n = u2/(255^2);                           %normalize variance
    R = 1 - 1/(1 + u2n);                        %measure R

    u3 = sum((((0:255) - m).^3).*p);            %compute third moment
    u3 = u3/(sqrt(u2)^3);
    %u3 = u3/(255^3);                           %normalize third moment

    U = sum(p.^2);                              %measure uniformity
    pe = p.*log2(p);                            %steps to comput entropy
    pe(isnan(pe)) = 0;                          %filter out nan's
    e = -sum(pe);                               %measure average entropy

end

