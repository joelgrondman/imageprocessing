function H = IPblurdir(M,N,a,b,T)

    u=1:N; v=1:M;           % offset from image origin
    
    cv=M/2;                     % center of (u,v) is defined as (M/2,N/2)
    cu=N/2;
    
    uc = u - cu;
    vc = v - cv;                % translate by image center
    [U,V] = meshgrid(uc,vc);      % create mesh of size M x N
    
    X = pi*(U*a+V*b);      % the term ua+vb is used multiple times
                                
    H = (T./X).*sin(X).*exp(-1j*X);  % the transform 
    I = isnan(H);             % find NaN's in H
    H(I) = 1;                         % NaN's become 1's
    
    H = ifftshift(H);       %
  
end

