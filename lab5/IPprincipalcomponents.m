function [ k, eigen,Cy ] = IPprincipalcomponents( f,k )

m=mean(f,2);

fc = double(f)-(m*ones(1,size(f,2))); %(Xk-mean) - mean is subracted from every vector (column) 

Cx = (1/size(f,2))*fc*fc'; %covariance

[A,lambda]=eig(Cx);
%A=A';
k;

eigen=sort(diag(lambda),'descend') %sorts eigenvalues in descending order

[sortedA,ind] = sort(A,2); %sorts the eigenvectors according to the correspondig eigenvalue

for r = 1:size(A,1)
   B(r,:) = B(r,ind(r,:));
end

A=B;

%other example
%[val ind]=sort(A);
%B=B(ind);

y=A*(double(f)-(m*ones(1,size(f,2)))); %Hotelling Transform

Cy = (1/size(f,2))*y*y' 

end