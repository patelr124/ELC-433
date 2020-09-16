[y, Fs]=audioread('good_news.wav');
y = y(:,1)';        % just keep left channel
                    % transpose to row vector
y = y / max(y);     % Normalize to max value of 1.0

t=1/Fs;
plot (289000:290000,y(1,289000:290000));