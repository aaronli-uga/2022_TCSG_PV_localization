% This script calculate the Impact Score and plot it in a certain time
% window range.

close all
clear
clc

% simulation time 0-30s, attack happens at 10-15s
fs = 20000;
start_time = 8.5;
end_time = 12.5;
stime = fs * start_time;
etime = fs * end_time;
ws = fs * 0.1;
step = ws * 0.2;
time_step = 0.1*0.2;

% load case 1: cyber attack: PV farm(node 727) Inverter 1
load('case4.mat')
close all

%%

% test data calculate node 709 current

tt = opvar(5:7,stime:etime); %799
% [n799, timelist] = node_score(tt, start_time, step, time_step, ws);
[n799, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(11:13,stime:etime); %702
% [n702, timelist] = node_score(tt, start_time, step, time_step, ws);
[n702, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(17:19,stime:etime); %705
% [n705, timelist] = node_score(tt, start_time, step, time_step, ws);
[n705, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(71:73,stime:etime); %742
% [n742, timelist] = node_score(tt, start_time, step, time_step, ws);
[n742, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(83:85,stime:etime); %727
% [n727, timelist] = node_score(tt, start_time, step, time_step, ws);
[n727, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(77:79,stime:etime); %744
% [n744, timelist] = node_score(tt, start_time, step, time_step, ws);
[n744, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(29:31,stime:etime); %709
% [n709, timelist] = node_score(tt, start_time, step, time_step, ws);
[n709, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(23:25,stime:etime); %707
% [n707, timelist] = node_score(tt, start_time, step, time_step, ws);
[n707, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(47:49,stime:etime); %714
% [n714, timelist] = node_score(tt, start_time, step, time_step, ws);
[n714, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(53:55,stime:etime); %725
% [n725, timelist] = node_score(tt, start_time, step, time_step, ws);
[n725, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(59:61,stime:etime); %732
% [n732, timelist] = node_score(tt, start_time, step, time_step, ws);
[n732, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(65:67,stime:etime); %733
% [n733, timelist] = node_score(tt, start_time, step, time_step, ws);
[n733, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(35:37,stime:etime); %710
% [n710, timelist] = node_score(tt, start_time, step, time_step, ws);
[n710, timelist] = node_score_compare(tt, start_time, step, time_step, ws);

tt = opvar(41:43,stime:etime); %711
% [n711, timelist] = node_score(tt, start_time, step, time_step, ws);
[n711, timelist] = node_score_compare(tt, start_time, step, time_step, ws);


%%
% get a window sample




% ISlist = [];
% timelist = [start_time];
% for i = 1+step : step : length(tt) - ws
%     c_cc = tt(1, i:i+ws);
%     p_cc = tt(1, i-step:i-step+ws);             
%     
%     SE = -sum(c_cc.^2.*log(c_cc.^2));
%     S = std(c_cc);
%     R = range(c_cc);
%     MD = abs(mean(p_cc) - mean(c_cc));
%     CF = abs(max(c_cc)) / mean(c_cc.^2);
%     
% %   The entropy has been removed to get a better result.
%     IS = (CF) * (S + R + MD);
%     ISlist = [ISlist, IS];
%     timelist = [timelist, timelist(end)+time_step];
% end

% plot(timelist(1:end-1), ISlist)
% title('IF score: node 709')
% xlabel('time')

%% plot figure case 1
% figure;
% plot(timelist(1:end-1), n799,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n702, 'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n705,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n742,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n727,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n744,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n709,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n711,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n707,'LineWidth',3);
% hold on;
% plot(timelist(1:end-1), n714,'LineWidth',3);
% hold on;
% plot(timelist(1:end-1), n725,'LineWidth',3);
% hold on;
% plot(timelist(1:end-1), n732,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n733,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n710,'LineWidth',2);
% lgd = legend('Node 799','Node 702', 'Node 705', 'Node 742', 'Node 727', 'Node 744'...
%     , 'Node 709', 'Node 711', 'Node 707', 'Node 714', 'Node 725', 'Node 732'...
%     , 'Node 733', 'Node 710');
% 
% lgd.FontSize = 35;
% title('Case1 cyber attack on node 727 (all nodes)')
% xlim([9.5, 11.02]);
% % ylim([0, 18])
% xlabel('Time(second)', 'FontSize', 42,'FontWeight','bold')
% ylabel('Normalized Impact Score (IS)', 'FontSize', 42,'FontWeight','bold')
% set(gca, 'FontSize', 42)

figure;
plot(timelist(1:end-1), n709,'LineWidth',3);
hold on;
plot(timelist(1:end-1), n744,'LineWidth',3);
hold on;
plot(timelist(1:end-1), n727,'LineWidth',3);
hold on;
xlim([9.5, 11.02]);
% ylim([0, 18])
xlabel('Time(second)', 'FontSize', 42, 'FontWeight','bold')
ylabel('Normalized Score (NS)', 'FontSize', 42, 'FontWeight','bold')
set(gca, 'FontSize', 42)

lgd = legend('Node 709', 'Node 744', 'Node 727');
lgd.FontSize = 35;
title('Case1 cyber attack on node 727')
%% plot figure case 4
figure;
% plot(timelist(1:end-1), n799,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n702, 'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n705,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n742,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n727,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n744,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n709,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n711,'LineWidth',2);
% hold on;
plot(timelist(1:end-1), n707,'LineWidth',3);
hold on;
plot(timelist(1:end-1), n714,'LineWidth',3);
hold on;
plot(timelist(1:end-1), n725,'LineWidth',3);
hold on;
% plot(timelist(1:end-1), n732,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n733,'LineWidth',2);
% hold on;
% plot(timelist(1:end-1), n710,'LineWidth',2);
% legend('Node 799','Node 702', 'Node 705', 'Node 742', 'Node 727', 'Node 744'...
%     , 'Node 709', 'Node 711', 'Node 707', 'Node 714', 'Node 725', 'Node 732'...
%     , 'Node 733', 'Node 710', 'Node 711')
lgd = legend('Node 707', 'Node 714', 'Node 725');
lgd.FontSize = 35;
title('Case4 ground fault on node 706')
% xlim([9.5, 10.5]);
xlim([9.5, 11.02])
% ylim([5.4, 6.3])
xlabel('Time(second)', 'FontSize', 40,'FontWeight','bold')
ylabel('Normalized Score (NS)', 'FontSize', 40,'FontWeight','bold')
set(gca, 'FontSize', 40)

% figure;
% plot(timelist(1:end-1), n707,'LineWidth',3);
% hold on;
% plot(timelist(1:end-1), n714,'LineWidth',3);
% hold on;
% plot(timelist(1:end-1), n725,'LineWidth',3);
% hold on;
% % xlim([9.93, 9.97]);
% % ylim([5.4, 6.3])
% xlabel('Time(second)', 'FontSize', 40, 'FontWeight','bold')
% ylabel('Normalized Score (NS)', 'FontSize', 40, 'FontWeight','bold')
% set(gca, 'FontSize', 40)
% 
% lgd = legend('Node 707', 'Node 714', 'Node 725');
% lgd.FontSize = 35;
% title('Case4 cyber attack on node 706 (zoom in)')