clear
close all 
[y, Fs] = audioread('la_la_land.m4a');          % read in audio file
y=y(:,1);                                       % load all elements of y into column 1
length_y=length(y);                             % Define length of y
x = y (1:length_y);                             % Define x
length_x = length(x);                           % Define length of x based off y length
 
figure(1)
x_fft = abs(fft(x));                            % Plot the entire FFT in this section
subplot(3,1,1);
plot(0:length_x-1, x_fft)
title ('FFT of extracted piece');
xlim([0 length_x]);
 
subplot(3,1,2);                                 % Plot the left half of the FFT here
plot(0:length_x-1,x_fft)
xlim([0 length_x/2]);
title ('FFT of left half of extracted piece');

subplot(3,1,3);                                 % Plot the zoomed in FFT
plot(0:length_x-1,x_fft)
xlim([0 9000]);
title ('FFT of left half of extracted piece zoomed in');
pause
 
segment_length = 1024;                          % Given in lab assignment
fft_length = 4096;                              % Given in lab assignment
figure(2)
hold on
idx = 1;
for i= 1:segment_length:(length_x-segment_length) % each cycle through the roof
data = x(i:i+segment_length-1);                   % computes one FFT segment
data_fft = abs(fft(data, fft_length));          % Inner for loop given in lab
coeffs(:,idx) = data_fft;
idx = idx + 1; 
plot(0:fft_length-1, data_fft)
xlim([0 400]);
end
 
figure(2)                                       % Given in lab report
surf(coeffs)
xlim([1 idx])
ylim([1 400])
xlabel('Segment #')
ylabel(sprintf('Frequency Bin, Total %d Bins, Sampling Rate = %d KHz',fft_length, Fs/1000))
title('Short-TIme Fourier Transform');
 
figure(3)                                      % Given in lab report
spectrogram(y,segment_length,1,fft_length,Fs) 

n=0:1:60;                                      % time window
impulse = (n+1).*.2.^n.*heaviside(n);
input = (n+1).*0.5.^n.*heaviside(n);
impulse_fft=fft(impulse);                       % take fft to define frequency domain signals
input_fft=fft(input);                           % complete multiplication in frequency domain
frequency_multi = impulse_fft .* input_fft;     % complete inverse transform of the signal in frequency domain back to time
multi_ifft=ifft(frequency_multi);       
figure(4)
subplot(3,1,1);
plot(n, abs(frequency_multi));                  % plot of the multiplied signals
title('Multiplied Signals (Frequency Domain)')
ylabel('Mag')
xlabel('Hz')

subplot(3,1,2);
plot(abs(multi_ifft));
title('Inverse FFT of Signals Multiplied in the Frequency Domain')
xlim([0 60]);
ylabel('Mag')
xlabel('Hz')

Cconv = cconv(impulse, input);                  % complete circular conv in the time domain
subplot(3,1,3);
plot(abs(Cconv));
title('Circular conv in time')
ylabel('Mag')
xlabel('t(s)')
xlim([0 60]);