function [xp,y,eigen] = IPprincipalcomponents( f,k )

    nv = size(f,2);             %number of pixels
    x = double(f);              %convert to double
    m=mean(x,2);                %obtain the mean vector
    Cx = x*x'/nv - m*m';        %covariance

    [A,eigen]=eig(Cx);          %obtain eigenvalues and eigenvectors
    %sort eigenvalues in descending order, sort eigenvectors accordingly
    [eigen,I] = sort(diag(eigen),'descend');   
    A = A(:,I);                 
    A = A';                     %transpose s.t. each row is an eigenvector

    y = A*(x - repmat(m,1,nv)); %perform hotelling transform

    At = A';
    %reconstruction from principal components (first k components)
    xp = At(:,1:k)*y(1:k,:) + repmat(m,1,nv);

end