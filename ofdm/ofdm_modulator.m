function txSignal = otfs_modulator(ddGrid)
% OTFS MODULATOR
% DD domain → TF domain → Time domain

    % ISFFT: Delay-Doppler → Time-Frequency
    tfGrid = isfft(ddGrid);

    % Heisenberg transform: TF → Time
    txSignal = heisenberg(tfGrid);
end
