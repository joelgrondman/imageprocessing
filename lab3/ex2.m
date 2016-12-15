f=[1,4,-3,0];
f2=[1,4,-3,0,1,4,-3,0];


disp('Discrete Wavelet Trandform of input function f')
W=IPdwt(f2,3)

disp('Inverse Discrete Wavelet Transform of input function W')
F=IPidwt(W,3)

