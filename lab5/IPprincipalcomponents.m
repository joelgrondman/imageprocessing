function [xp,y,eigen] = IPprincipalcomponents( f,k )

    
    nv = size(f,2);             %number of pixels
    
    %x = im2double(f);           %convert to double
    x = double(f);
    m=mean(x,2);                %obtain the mean vector
    Cx = x*x'/nv - m*m';        %covariance

    [A,eigen]=eig(Cx);          %obtain eigenvalues and eigenvectors
    %sort eigenvalues in descending order, sort eigenvectors accordingly
    [eigen,I] = sort(diag(eigen),'descend');   
    A = A(:,I);                 
    A = A';                     %transpose s.t. each row is an eigenvector
    %A=A';
    %k;

    
    y = A*(x - m);              %perform hotelling transform

    %Cy = A*Cx*A'
    At = A';
    xp = At(:,1:k)*y(1:k,:) + m;
    
    %xp = uint8(xp);
    %other example
    %[val ind]=sort(A);
    %B=B(ind);

    %y=A*(double(f)-(m*ones(1,size(f,2)))); %Hotelling Transform

    %Cy = (1/size(f,2))*y*y' 

end