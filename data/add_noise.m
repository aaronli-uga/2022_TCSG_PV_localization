% This script adds noise to raw waveform
close all
clear
clc

% simulation time 0-30s, attack happens at 10-15s
fs = 20000;
stime = fs * 9.65;
etime = fs * 9.73;

load('normalcase.mat')
case_n = opvar;

t = case_n(1,stime:etime);
snr = 10;
y = awgn(case_n(65,stime:etime), 15, 'measured');


figure;
% plot(case_n(1,stime:etime),case_n(65,stime:etime),'LineWidth',3)
plot(t, y,'LineWidth',3)
xlabel('time(s)')
ylabel('current(A)')