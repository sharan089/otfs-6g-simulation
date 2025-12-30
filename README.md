\# OTFS 6G Simulation Project



This repository contains a MATLAB implementation of Orthogonal Time Frequency Space (OTFS) modulation designed for high-mobility 6G wireless communication systems.



\## Project Structure



\- transmitter/   | OTFS modulation blocks (ISFFT, Heisenberg)

\- receiver/      | OTFS demodulation blocks (Wigner, SFFT)

\- channel/       | AWGN and doubly selective channel models

\- ofdm/          | OFDM modulator and demodulator for comparison

\- analysis/      | BER calculation and plotting scripts

\- results/       | Simulation results (BER files, plots)



\## System Flow



Bits → QAM → Delay-Doppler Grid → ISFFT → Heisenberg Transform → Channel  

→ Wigner Transform → SFFT → BER Calculation



\## Requirements



\- MATLAB R2020a or later

\- Communications Toolbox



\## How to Run



1\. Open MATLAB

2\. Set this repository folder as the working directory

3\. Run the main script:



&nbsp;  main\_otfs\_simulation.m



\## Output



\- BER vs SNR performance plot

\- Result files saved in the results/ folder



\## Applications



\- High-mobility wireless communication

\- 6G waveform research

\- Delay-Doppler domain signal processing

\- OTFS vs OFDM performance comparison



\## Author



Sarvesh Shivasharan



