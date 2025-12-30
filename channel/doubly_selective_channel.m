function y = doubly_selective_channel(x, delays, dopplers, gains, fs)
% Doubly Selective Channel Model
% x        : transmitted signal
% delays   : path delays (in samples)
% dopplers : Doppler shifts (Hz)
% gains    : complex path gains
% fs       : sampling frequency

N = length(x);
t = (0:N-1).'' / fs;

y = zeros(N,1);

for l = 1:length(gains)
    % Doppler effect
    doppler_phase = exp(1j*2*pi*dopplers(l)*t);

    % Apply Doppler
    x_dopp = x .* doppler_phase;

    % Apply delay
    x_delayed = [zeros(delays(l),1); ...
                 x_dopp(1:end-delays(l))];

    % Accumulate paths
    y = y + gains(l) * x_delayed;
end
end
