clc;
clear;
close all;

% ================== PARAMETERS ==================
M = 4;              % QPSK
N = 32;             % Doppler bins
K = 32;             % Delay bins
numSymbols = N*K;

SNR_dB = 0:5:30;
ber_otfs = zeros(length(SNR_dB),1);

% ================== DATA ==================
dataBits = randi([0 1], numSymbols*log2(M), 1);

% QAM Modulation
qamSymbols = qammod(dataBits, M, ...
    'InputType','bit','UnitAveragePower',true);

% Delay-Doppler Grid
X_dd = reshape(qamSymbols, N, K);

% ================== SIMULATION ==================
for i = 1:length(SNR_dB)

    % -------- OTFS TRANSMITTER --------
    X_tf = isfft(X_dd);              % ISFFT
    txSig = heisenberg(X_tf);        % Heisenberg transform

    % -------- CHANNEL --------
    rxSig = awgn_channel(txSig, SNR_dB(i));

    % -------- OTFS RECEIVER --------
    Y_tf = wigner(rxSig, N, K);       % Wigner transform
    Y_dd = sfft(Y_tf);                % SFFT

    % QAM Demodulation
    rxBits = qamdemod(Y_dd(:), M, ...
        'OutputType','bit','UnitAveragePower',true);

    % BER Calculation
    ber_otfs(i) = mean(rxBits ~= dataBits);
end

% ================== PLOT ==================
figure;
semilogy(SNR_dB, ber_otfs, '-o','LineWidth',2);
grid on;
xlabel('SNR (dB)');
ylabel('BER');
title('OTFS BER Performance');
save('results/ber_otfs.mat','ber_otfs');
save('results/ber_ofdm.mat','ber_ofdm');
