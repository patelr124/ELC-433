clc
clear
f1 = 10.5/200;
f2 = 16/200;
Fs = 1000;
t = 0:1:199;
signal = cos(2*pi*f1*t) + 0.01*cos(2*pi*f2*t);
fft_signal = abs(fft(signal));
signaldB = mag2db(fft_signal);
maxdB = max(signaldB);
signaldB = signaldB - maxdB;
                                       
sig_length=length(signaldB);                    % Define length of sigdB
x = signaldB (1:sig_length);                    % Define x
length_x = length(x);

figure(1)
plot(0:length_x-1, signaldB);
xlim([0 length_x/2])
ylim([-70 0])
pause

figure(2)
kbwindow = (kbdwin(200));
plot(kbwindow);
pause

kb_fft = abs(fft(kbwindow));
kb_fft_dB = mag2db(kb_fft);
kb_maxdB = max(kb_fft_dB);
kb_fft_dB = kb_fft_dB - kb_maxdB;

kb_length=length(kb_fft_dB);                    % Define length of sigdB
x_kb = kb_fft_dB (1:kb_length);                 % Define x
length_xkb = length(x_kb);
figure(3)
plot(0:length_xkb-1, kb_fft_dB);
xlim([0 length_xkb/2])
ylim([-70 0])