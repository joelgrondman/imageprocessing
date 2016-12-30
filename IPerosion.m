function image = IPerosion(f,F)

   [nr,nc]=size(f);
    
    f_uu = [f(2:nr,:); zeros(1,nc)];      % one row up
    f_dd = [zeros(1,nc); f(1:nr-1,:)];           % one row down
    f_ll = [f(:,2:nc) zeros(nr,1)];               % one column to left
    f_rr = [zeros(nr,1) f(:,1:nc-1)];         % one column to right
    f_ur = [zeros(nr - 1,1) f(2:nr,1:nc-1); zeros(1,nc)]; % up right
    f_ul = [f(2:nr,2:nc) zeros(nr - 1,1); zeros(1,nc)];   % up left
    f_dr = [zeros(1,nc) ; zeros(nr - 1,1) f(1:nr - 1,1:nc-1)]; % down right
    f_dl = [zeros(1,nc) ; f(1:nr-1,2:nc) zeros(nr - 1,1)];     % down left
   
    image = f_uu.*F(3,2)+f_dd.*F(1,2)+f_ll.*F(2,3)+f_rr.*F(2,1)+...
        f_ur.*F(3,1)+f_ul.*F(3,3)+f_dr.*F(1,1)+f_dl.*F(1,3)+f.*F(2,2)...
        == sum(sum(F));
    
end

