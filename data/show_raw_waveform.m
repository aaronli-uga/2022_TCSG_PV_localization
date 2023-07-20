% This script shows the raw waveform in different cases
% normal, case 2 on 744, case 3 on, case 4 on, case 6 on.
% This script plot the waveform given the starttime and endtime.
close all
clear
clc

% simulation time 0-30s, attack happens at 10-15s
fs = 20000;
stime = fs * 9.96;
etime = fs * 10.06;

load('normalcase.mat')
case_n = opvar;
load('case2.mat')
case_2 = opvar;
load('case4.mat')
case_4 = opvar;
load('case6.mat')
case_6 = opvar;

% case 2 on 744, case 6 on 733
figure;
plot(case_6(1,stime:etime),case_6(62:64,stime:etime),'LineWidth',3)
xlabel('time(s)')
ylabel('Voltage(V)')
% title('node 744 current')
xlim([9.96, 10.06]);
ylim([-5000, 5500]);
xlabel('Time(second)', 'FontSize', 42, 'FontWeight','bold')
ylabel('Voltage (V)', 'FontSize', 42, 'FontWeight','bold')
set(gca, 'FontSize', 42)