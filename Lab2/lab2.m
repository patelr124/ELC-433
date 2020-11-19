% Part 2
alpha = 0.95;                               % Given in lab
n = [0:1:199];                              % Given in lab
x = alpha.^n;                               % .^ operation due to vector
figure(1)
stem(0:199,x,'filled', 'MarkerSize',2);     % Lines 6-9 given in lab
xlabel('Index n')
title(sprintf('%0.2f^n',alpha))             % set title
xlim([0 200])                               % set horizontal axis limits

% Part 3
figure(2)
N = 1024;                                   % Given in lab
omega = [0:(2*pi/N):(2*pi*1023/N)];         % omega expressed as vector, given in lab
magnitude = 1./sqrt((1-alpha*cos(omega)).^2 + (alpha*sin(omega)).^2);
                                            % magnitude derived from paper
                                            % and pencil analysis part 1
plot(omega, magnitude);
xlabel('\omega')                            % label x-axis with fancy w
title('|X(e^{j\omega})| vs. \omega')        % set title
xlim([0 2*pi])                              % set horizontal axis limits

% Part 4
Xf = fft(x, N);                             % fft with 1024 padding
figure(3)
subplot(2,1,1);
plot((0:1023)*2*pi/1024, abs(Xf))           % 2 subplots, stacked vert
xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])    % set ticks to be pi-ish
xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'}) 

mag_dtft = 1./(sqrt((1-0.95*cos(omega)).^(2) + (0.95*sin(omega)).^(2)));
                                            % pi-ish labels
title('|Xf(e^{j\omega})|')                  % set title
ylim([0 20])                                % set vertical axis limits
xlim([0 (2*pi)])                            % set horizontal axis limits
subplot(2,1,2);
plot((0:1023)*2*pi/1024, mag_dtft)     
xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])    % set ticks to be pi-ish
xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'})                                            % pi-ish labels
title('|X(e^{j\omega})|')                   % set title
ylim([0 20])                                % set vertical axis limits
xlim([0 (2*pi)])                            % set horizontal axis limits

% Part 6
new_n = [0:1:255];                          % Given in lab
new_N = 256;                                % Given in lab
y1 = sin(2*pi*new_n/new_N);                 % Given in lab
y2 = cos(4*pi*new_n/new_N);                 % Given in lab
y3 = cos(22*pi*new_n/new_N);                % Given in lab
y4 = cos(202*pi*new_n/new_N);               % Given in lab
y_n = y1 + y2 + y3 + y4;                    % Given in lab
figure(4)
x0=10;                                      % lines 56-60 resizing figure
y0=10;
width=900;
height=600;
set(gcf,'position',[x0,y0,width,height])
stem(new_n, y_n, 'MarkerSize', 4);          % decrease marker size
title('FFT');                               % set title
ylim([-4 3])                                % set vertical axis limits
ylabel('y[n]')                              % label vertical axis
xlim([0 255])                               % set horizontal axis limits
xlabel('n')                                 % label horizontal axis

% Part 7
abs_fft = abs(fft(y_n, new_N));             % absolute value of fft given in lab
figure(5)
x0=10;                                      % lines 71-75 resizing graph
y0=10;
width=900;
height=600;
set(gcf,'position',[x0,y0,width,height])
stem(new_n, abs_fft, 'MarkerSize', 4)       % decrease marker size
title('abs( fft ( y[n] )) 256 samples');                % set title
xlim([0 255])                               % set horizontal axis limits
ylim([0 140])                               % set vertical axis limits
xlabel('n')                                 % label horizontal axis
ylabel('absolute value')                    % label vertical axis

figure(6)       
x0=10;                                      % lines 86-90 resizing figure
y0=10;          
width=900;
height=600;
set(gcf,'position',[x0,y0,width,height])
stem(new_n, abs_fft, 'MarkerSize', 4)     % decrease marker size
title('abs( fft ( y[n] )) first 128 samples');                % set title
xlim([0 128])                               % set horizontal axis limits
ylim([0 140])                                % set vertical axis limits
xlabel('n')                                 % label horizontal axis
ylabel('absolute value')                    % label vertical axis

figure(7)
subplot(2,1,1)
stem(new_n, real(fft(y_n, new_N)));
title('Real');     
xlabel('n')                                 % label horizontal axis
ylabel('real value')
xlim([0 128])                               % set horizontal axis limits
ylim([-20 140])                             % set vertical axis limits

subplot(2,1,2)         
stem(new_n, imag(fft(y_n, new_N)));
title('Imaginary');
xlabel('n')                                 % label horizontal axis
ylabel('imaginary value')
xlim([0 128])                               % set horizontal axis limits
ylim([-140 20])                             % set vertical axis limits

% Part 8
figure(9)
N = 256;
t = new_n/new_N;
y5 = cos(23*pi*t);                          % exactly 11.5 cycles
Fy = fft(y5);                               % take the FFT
subplot(2,1,1)                              % stack 2 vertical, 1st
stem(0:(N/2-1),abs(Fy(1:N/2)),'filled','MarkerSize',2) % plot N-point FFT
xlim([0 128])                               % set plot width
Fy_16 = fft(y5,N*16);                       % FFT with 4096 samples
subplot(2,1,2)                              % stack 2 vertical, 2nd
plot(0:(16*N/2-1),abs(Fy_16(1:16*N/2)))     % line plot for detail
xlim([0 N*16/2])                            % set plot width

figure(10)                             
plot(0:(16*N/2-1),abs(Fy_16(1:16*N/2)))     % line plot for detail
xlim([0 N*16/2])                            % set plot width
hold on

stem(0:16:(16*N/2-1),abs(Fy(1:N/2)), 'MarkerSize', 2)% line plot for detail
xlim([0 N*16/2])                            % set plot width
hold off