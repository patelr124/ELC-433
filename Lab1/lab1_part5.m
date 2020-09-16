[y, Fs]=audioread('good_news.wav');
y = y(:,1)';        % just keep left channel
                    % transpose to row vector
y = y / max(y);     % Normalize to max value of 1.0

t=1/Fs;
plot (289000:290000,y(1,289000:290000));

load('filt_3300_48000_coeffs.mat'); 
yf = conv(y, Num, 'same');
yf = yf / max(y);


impulse_resp = Num;
impulse_resp_len = length(impulse_resp);
num_padding = impulse_resp_len - 1;
lft_padding = floor(num_padding/2);
rgt_padding = num_padding - lft_padding;
y_pad = [ zeros(1,lft_padding), y, zeros(1,rgt_padding) ]; % pad with 0’s
% left and right


NUM_SAMPS = length(y); % Get the number of samples in y
yf1 = zeros(1, NUM_SAMPS); % result will go into yf1, start out all zeros!

for n=1:NUM_SAMPS
    impulse_resp_b =  impulse_resp(numel(impulse_resp): -1:1);
    yf1(n) = impulse_resp_b * y_pad(n:n+num_padding)';
end
yf1 = yf1 / max(yf1); % Normalize to max value of 1.0

fprintf("Max difference, yf1 vs. conv() function: %g\n", max(abs(yf-yf1)));
