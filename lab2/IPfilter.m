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
    
    % apply uniform filter
    B = (X + X_uu + X_dd + X_ll + X_rr + X_ur + X_ul + X_dr + X_dl)/9;
    
    X = im2uint8(B);

end

