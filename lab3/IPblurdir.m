function H = IPblurdir(M,N,a,b,T)

    u=0:N-1; v=0:M-1;           % offset from image origin
    
    cv=floor(M/2);              % center of (u,v) is defined as (M/2,N/2)
    cu=floor(N/2);
    
    uc = u - cu;
    vc = v - cv;               % translate by image center
    [U,V] = meshgrid(uc,vc);      % create mesh of size M x N
    
    X = pi*(U*a+V*b);      % the term ua+vb is used multiple times                      
    H = (T./X).*sin(X).*exp(-1j*X);  % the transform 
    H(isnan(H)) = 1;                 % NaN's become 1's

   
end

