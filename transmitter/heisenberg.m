function tx = heisenberg(X_tf)
% HEISENBERG TRANSFORM
% Converts time-frequency grid to time-domain OTFS signal

    % IFFT along time axis
    tx = ifft(X_tf, [], 1);

    % Serialize to 1-D transmit signal
    tx = tx(:);

end
