f=[1 -2 3 -4 5 -6 7 -8]


disp('Discrete Wavelet Trandform of input function f')
for i = 0:3
    W=IPdwt(f,i)
end
disp('Inverse Discrete Wavelet Transform of input function W')
for i = 0:3
    f=IPidwt(W,i)
end

