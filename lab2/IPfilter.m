function X = IPfilter(image)

    X = im2double(image);
    [nr, nc] = size(X);
    
    % Shift X in 8 directions, edges are given value zero
    X_uu = [X(2:nr,:); zeros(1,nc)];      % one row up
    X_dd = [zeros(1,nc); X(1:nr-1,:)];           % one row down
    X_ll = [X(:,2:nc) zeros(nr,1)];               % one column to left
    X_rr = [zeros(nr,1) X(:,1:nc-1)];         % one column to right
    X_ur = [zeros(nr - 1,1) X(2:nr,1:nc-1); zeros(1,nc)]; % up right
    X_ul = [X(2:nr,2:nc) zeros(nr - 1,1); zeros(1,nc)];   % up left
    X_dr = [zeros(1,nc) ; zeros(nr - 1,1) X(1:nr - 1,1:nc-1)]; % down right
    X_dl = [zeros(1,nc) ; X(1:nr-1,2:nc) zeros(nr - 1,1)];     % down left
    
    % kernel
    F = [1 1 1;                                        
         1 1 1;
         1 1 1];
    
    B = (X*F(2,2) + X_uu*F(1,2) + X_dd*F(3,2) + X_ll*F(2,1) +...
        X_rr*F(2,3) + X_ur*F(1,3) + X_ul*F(1,1) + X_dr*F(3,3) +...
        X_dl*F(3,1));                 % nonuniform filter
    
    % determine weight matrix, coefficient is different in edges
    % apply weight to middle elements
    B(2:nr-1,2:nc-1) = B(2:nr-1,2:nc-1)/sum(F(:));
    
    % apply weight on first and last rows
    B(1,2:nc-1) = B(1,2:nc-1)/sum(sum(F(2:end,:)));
    B(nr,2:nc-1) = B(nr,2:nc-1)/sum(sum(F(1:end-1,:)));
    
    % apply weight on first and last columns
    B(2:nr-1,1) = B(2:nr-1,1)/sum(sum(F(:,2:end)));
    B(2:nr-1,nc) = B(2:nr-1,nc)/sum(sum(F(:,1:end-1)));
    
    % apply weight to corners
    B(1,1) = B(1,1)/sum(sum(F(2:end,2:end)));
    B(nr,1) = B(nr,1)/sum(sum(F(2:end,1:end-1)));
    B(1,nc) = B(1,nc)/sum(sum(F(1:end-1,2:end)));
    B(nr,nc) = B(nr,nc)/sum(sum(F(1:end-1,1:end-1)));
    
    X = im2uint8(B);

end

