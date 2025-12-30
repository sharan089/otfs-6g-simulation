function ber = ber_calculation(txBits, rxBits)

    minLen = min(length(txBits), length(rxBits));
    ber = sum(txBits(1:minLen) ~= rxBits(1:minLen)) / minLen;

end
