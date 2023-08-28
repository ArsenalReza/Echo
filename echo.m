%% Read File
clc
close all
clear
[y,Fs] = audioread("C:\Users\Active\Documents\Sound recordings\Recording.m4a");

%% create Echo frequency
b = y(1: length(y));  % we use this method to pick one channel
b_echo = b; % we make a copy
N = Fs/2;
n = N+1 : length(b);
b_echo(n) = b(n) + b(n-N); % we calculate the sum of data in each iteration, like Cumulative distribution in statistics

time = (1/Fs)*length(b_echo); % calculating the duration of selected part of voice
t = linspace(0, time, length(b)); % vectorized duration

figure
subplot(311)
plot(t, b, '--r')
xlabel("time(sec)")
ylabel("signal strength")
title("normal signal")

subplot(312)
plot(t, b_echo, '--b')
xlabel("time(sec)")
ylabel("signal strength")
title("echo-ed signal")

subplot(313)
plot(t, b_echo, '--b')
hold on
plot(t, b, '--r')
xlabel("time(sec)")
ylabel("signal strength")
title("normal and echo-ed signal")

filename = 'audio.m4a';
audiowrite(filename, b_echo, Fs)

save voicel.m4a filename




