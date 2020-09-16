Fs=48000;                                                            % sampling frequency - given in lab handout
Ts=1/Fs;                                                             % formula for sampling time
F0=1000;                                                             % initial frequency - given in lab handout
DUR = 2;                                                             % duration of signal - given in lab handout
hold off
for sampling_f = 1:5:31
    nFs = Fs/sampling_f;
    w = linspace(0,DUR,nFs*DUR);
    wave = sin(2*pi*F0*w);
    if (F0 >= nFs/2)                                                 % determines if meets Nyquist reqs
        nyq = "BEYOND Nyquist";
        else
        nyq = "MEETS Nyquist";
    end
    sound(wave,nFs);                                                 % plays sound
    plot(w, wave);                                                   % plots waves
    xlabel("Time (s)");
    ylabel("Amplitude");
    title("Signal with Fs="+round(nFs,2)+" Hz--"+nyq);
    xlim([0 0.008])
    pause(8)
end
hold on 
w = linspace(0,DUR,Fs*DUR);                                         % plots original wave over again
wave = sin(2*pi*F0*w);
plot(w, wave);
