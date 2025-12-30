function tx_ofdm = ofdm_modulator(dataBits, M, Nsub)
% ----------------------------------------
% OFDM MODULATOR
% dataBits : input bit stream
% M        : QAM order (e.g., 4 for QPSK)
% Nsub     : number of subcarriers
% ----------------------------------------

% QAM mapping
qamSymbols = qammod(dataBits, M, ...
    'InputType','bit', ...
    'UnitAveragePower', true);

% Serial to parallel
numSymbols = floor(length(qamSymbols)/Nsub);
qamSymbols = qamSymbols(1:numSymbols*Nsub);
ofdmGrid = reshape(qamSymbols, Nsub, numSymbols);

% IFFT
ifftData = ifft(ofdmGrid, Nsub, 1);

% Add cyclic prefix (25%)
cpLen = Nsub/4;
cp = ifftData(end-cpLen+1:end, :);
ofdmWithCP = [cp; ifftData];

% Parallel to serial
tx_ofdm = ofdmWithCP(:);

end
