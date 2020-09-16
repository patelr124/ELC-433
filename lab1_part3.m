highFreq = 80000;                       % frequency given lab handout
ts = 1/80000;                           % closely approx. continous time given in handout
fo = 995;                               % initial tone frequency given in handout
t=(0:ts:2);                             % vector representing sampling times
signal = sin(2*pi*fo*t);                % fundamental sine formula, highly sampled
figure(1)                               % est. figure for first comparison plot
plot(t, signal);                        
xlim([0, 0.002])                        % shrink x limit on the graph to better display
xlabel("Time (s)");                     % the data
ylabel("Amplitude");
title("Tone Frequency is 995 Hz");
hold on                                 % hold on for data comparison            

fs = 8000;                              % frequency given lab handout
tds = 1/8000;                           % discrete sampling
fo = 995;                               % initial tone frequency given in handout
tt=(0:tds:2);                           % vector representing sampling times
signal = sin(2*pi*fo*tt);               % fundamental sine formula, discretely sampled
stem(tt, signal);
xlim([0, 0.002]);                       % match the signal bounds above
xlabel("Time (s)");                     
ylabel("Amplitude");                    

hold off                                % hold off, only need two signals per graph
                                        % repeat until all corresponding 
                                        % signals are plotted
                                        % 1:8 * 995 Hz and 1:8 * 1000 Hz

figure(2)
signal = sin(2*pi*1000*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 1000 Hz");
hold on
signal = sin(2*pi*1000*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(3)
signal = sin(2*pi*1990*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 1990 Hz");
hold on
signal = sin(2*pi*1990*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(4)
signal = sin(2*pi*2000*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 2000 Hz");
hold on
signal = sin(2*pi*2000*tt);
stem(tt, signal);
xlim([0, 0.002]);                       
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(5)
signal = sin(2*pi*2985*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude");
title("Tone Frequency is 2985 Hz");
hold on
signal = sin(2*pi*2985*tt);
stem(tt, signal);
xlim([0, 0.002]);                       
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(6)
signal = sin(2*pi*3000*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 3000 Hz");
hold on
signal = sin(2*pi*3000*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(7)
signal = sin(2*pi*3980*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 3980 Hz");
hold on
signal = sin(2*pi*3980*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(8)
signal = sin(2*pi*4000*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 4000 Hz");
hold on
signal = sin(2*pi*4000*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(9)
signal = sin(2*pi*4975*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 4975 Hz");
hold on
signal = sin(2*pi*4975*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(10)
signal = sin(2*pi*5000*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 5000 Hz");
hold on
signal = sin(2*pi*5000*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(11)
signal = sin(2*pi*5970*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude");
title("Tone Frequency is 5970 Hz");
hold on
signal = sin(2*pi*5970*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(12)
signal = sin(2*pi*6000*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 6000 Hz");
hold on
signal = sin(2*pi*6000*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(13)
signal = sin(2*pi*6965*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 6965 Hz");
hold on
signal = sin(2*pi*6965*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(14)
signal = sin(2*pi*7000*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 7000 Hz");
hold on
signal = sin(2*pi*7000*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(15)
signal = sin(2*pi*7960*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 7960 Hz");
hold on
signal = sin(2*pi*7960*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off

figure(16)
signal = sin(2*pi*8000*t);
plot(t, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
title("Tone Frequency is 8000 Hz");
hold on
signal = sin(2*pi*8000*tt);
stem(tt, signal);
xlim([0, 0.002]);
xlabel("Time (s)");                     
ylabel("Amplitude"); 
hold off