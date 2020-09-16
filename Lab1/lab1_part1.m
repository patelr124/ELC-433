Fs=8000;                                                                     % freq given in lab handout
Ts=1/Fs;                                                                     % formula for sampling time
F0=440;                                                                      % initial frequency - given in lab handout
DUR = 2;                                                                     % duration of signal - given in lab handout
T = linspace(0,DUR,Fs*DUR);                                                  % vector of times to be sampled
wave = sin(2*pi*F0*T);                                                       % fundamental signal

if (F0 >= Fs/2)                                                              % checks to see if meets Nyquist reqs
    nyq = "BEYOND Nyquist";
else
    nyq = "MEETS Nyquist";
end
hold on
plot(T,wave);
stem(T,wave);
xlim([0 0.008])                                                              % changes limits on x axis for higher visibility
xlabel("Time (s)");
ylabel("Amplitude");
title ("Signal for A Note--"+nyq);
sound(wave,Fs);                                                              % plays sound produced by graphed signal
pause (8);                                                                   % holds the graph for 3 seconds
hold off
for harmonic = 3:4:13                                                        % traverses through 3 to 13 in increments of 4
    wave = wave + sin(2*harmonic*pi*F0*T)/harmonic;                          % adds lower harmonic to the signal 
    wave = wave + sin(2*(harmonic+2)*pi*F0*T)/(harmonic+2);                  % adds higher harmonic to the signal 
    plot(T,wave);
    xlim([0 0.008])
    xlabel("Time (s)");
    ylabel("Amplitude");
    if (F0*harmonic >= Fs/2)                                                 % determines if meets Nyquist reqs
        nyq = "BEYOND Nyquist";
        else
        nyq = "MEETS Nyquist";
    end
    title("Signal with "+harmonic+" and "+(harmonic+2)+" harmonics--"+nyq);
    sound(wave,Fs);
    pause(8);
end


hold on                                                                      % keeps previous plot visible
fs2=80000;                                                                   % freq given in lab handout
ts2=1/fs2;                                                                   % formula for sampling time
t2 = linspace(0,DUR,fs2*DUR);                                                % vector of times to be samples
wave2 = 0;                                                                   % initializes wave2 variable
for harmonic = 1:2:13                                                        % traverse from 1 to 13 in increments of 2
    wave2 = wave2 + sin (2*pi*harmonic*F0*t2)/harmonic;                      % adds harmonic to the signal
end
sound(wave2, fs2);
title ('Waveform up to 13th Harmonic at 80,000Hz');
plot(t2, wave2);

