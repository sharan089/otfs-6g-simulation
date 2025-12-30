function tx = heisenberg(X_tf)
% HEISENBERG TRANSFORM
% Converts time-frequency grid to time-domain signal

    tx = ifft(X_tf, [], 1);   % IFFT over time dimension
    tx = tx(:);               % Serialize signal
end
