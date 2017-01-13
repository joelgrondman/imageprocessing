function [ output_args ] = Iptexturemeasures( f )

z = 1;

p=histcounts(f,-0.5:255.5)/size(f(:),1);
m=mean(f(:));
%u2=sum(sum(((double(f) - m).^2).*p(f)))
u2=sum(sum(((double(f) - m).^2)))/size(f(:),1)
u2 = u2/(255^2)
varr = var(double(f(:)),1)
u3=sum(sum(((double(f) - m).^3)))/size(f(:),1)
u3 = u3/(255^3)
end

