function X_tf = isfft(X_dd)
% ISFFT - Inverse Symplectic Finite Fourier Transform
% Converts Delay-Doppler domain symbols to Time-Frequency domain

    [N, K] = size(X_dd);

    % ISFFT operation
    X_tf = fft(ifft(X_dd, [], 1), [], 2) / sqrt(N*K);

end
