%Another time varient singal alternating between frequency 300hz and 450hz and
%impulse
close all; clc; clear;
observe_time = 1;
sample_freq = 1024;
n_sample_pt = observe_time * sample_freq + 1;
time_line = linspace(0, 1, n_sample_pt);
dt = 1/sample_freq;
f1 = 300;
f2 = 170;
a1 = 10;
a2 = 35;

signal = zeros([n_sample_pt, 1]);
for i = 1:n_sample_pt
    t = dt*(i-1);
    if t <= 0.5
        signal(i) = a1*sin(2*pi*f1*t);
    else
        signal(i) = a2*sin(2*pi*f2*t);
    end
end

figure;
subplot(3, 1, 1);
plot(time_line, signal);
title("Time Response");

subplot(3, 1, 2);
plot(abs(2*fft(signal)/n_sample_pt));
xlim([0, 512]);
title("Fourier Specturm");
ylabel("Amplitude")
xlabel("Frequency (hz)");

subplot(3, 1, 3);
spectrogram(signal, hann(256), [], [], sample_freq, "yaxis"); %not giving argument noverlap and f
title("Spectrogram")
ylabel("Frequency")
xlabel("Time (ms)")


