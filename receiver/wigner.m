
function Y_tf = wigner(rx, N, K)

    % Reshape received time-domain samples
    rx_matrix = reshape(rx, N, K);

    % Apply FFT along Doppler dimension
    Y_tf = fft(rx_matrix, [], 1);

end
