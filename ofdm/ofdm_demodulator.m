function rxBits = ofdm_demodulator(rxSignal, M, Nsub)
% ----------------------------------------
% OFDM DEMODULATOR
% rxSignal : received time-domain OFDM signal
% M        : QAM order
% Nsub     : number of subcarriers
% ----------------------------------------

cpLen = Nsub/4;
symLen = Nsub + cpLen;

% Reshape received signal
numSymbols = floor(length(rxSignal)/symLen);
rxSignal = rxSignal(1:numSymbols*symLen);
rxMatrix = reshape(rxSignal, symLen, numSymbols);

% Remove cyclic prefix
rxNoCP = rxMatrix(cpLen+1:end, :);

% FFT
fftData = fft(rxNoCP, Nsub, 1);

% Parallel to serial
rxQAM = fftData(:);

% QAM demodulation
rxBits = qamdemod(rxQAM, M, ...
    'OutputType','bit', ...
    'UnitAveragePower', true);

end
