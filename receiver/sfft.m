
function X_dd = sfft(X_tf)

    [N, K] = size(X_tf);

    % FFT along Doppler axis
    % IFFT along Delay axis
    X_dd = ifft(fft(X_tf, [], 1), [], 2) * sqrt(N*K);

end
