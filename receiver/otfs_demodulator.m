function ddRx = otfs_demodulator(rxSignal, N, K)
% OTFS DEMODULATOR
% Time domain → TF domain → DD domain

    % Wigner transform: Time → TF
    tfRx = wigner(rxSignal, N, K);

    % SFFT: TF → Delay-Doppler
    ddRx = sfft(tfRx);
end
