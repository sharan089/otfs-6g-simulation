function y = awgn_channel(x, SNR_dB)
    % AWGN channel model
    y = awgn(x, SNR_dB, 'measured');
end
