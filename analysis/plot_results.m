function plot_results(SNR_dB, ber_otfs, ber_ofdm)

    figure;
    semilogy(SNR_dB, ber_otfs, '-o','LineWidth',2); hold on;
    semilogy(SNR_dB, ber_ofdm, '-s','LineWidth',2);
    grid on;
    xlabel('SNR (dB)');
    ylabel('BER');
    legend('OTFS','OFDM');
    title('BER Comparison of OTFS and OFDM');

end
