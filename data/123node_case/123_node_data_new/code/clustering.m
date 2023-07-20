%do the spectral clustering

close all;
clear;
clc;

% simulation time 0-30s, attack happens at 10-20s
fs = 5000;
ss = fs * 9.5;
ee = fs * 20.5;

% load('../normalcase.mat')
load('../fault.mat')
% load('../attack1.mat')
% load('../attack2.mat')

data51 = opvar;

%%

% This section get the waveform of every node in the 51 nodes dataset.

data51r(1,:) = [data51(2, ss:ee), data51(5, ss:ee)];
data51r(2,:) = [data51(8, ss:ee), data51(9, ss:ee)];
data51r(3,:) = [data51(10, ss:ee), data51(11, ss:ee)];
data51r(4,:) = [data51(12, ss:ee), data51(15, ss:ee)];
data51r(5,:) = [data51(18, ss:ee), data51(19, ss:ee)];
data51r(6,:) = [data51(20, ss:ee), data51(21, ss:ee)];
data51r(7,:) = [data51(22, ss:ee), data51(23, ss:ee)];
data51r(8,:) = [data51(24, ss:ee), data51(27, ss:ee)];
data51r(9,:) = [data51(30, ss:ee), data51(33, ss:ee)];
data51r(10,:) = [data51(36, ss:ee), data51(37, ss:ee)];
data51r(11,:) = [data51(38, ss:ee), data51(41, ss:ee)];
data51r(12,:) = [data51(44, ss:ee), data51(45, ss:ee)];
data51r(13,:) = [data51(46, ss:ee), data51(48, ss:ee)];
data51r(14,:) = [data51(50, ss:ee), data51(51, ss:ee)];
data51r(15,:) = [data51(52, ss:ee), data51(55, ss:ee)];
data51r(16,:) = [data51(58, ss:ee), data51(61, ss:ee)];
data51r(17,:) = [data51(64, ss:ee), data51(65, ss:ee)];
data51r(18,:) = [data51(66, ss:ee), data51(69, ss:ee)];
data51r(19,:) = [data51(72, ss:ee), data51(75, ss:ee)];
data51r(20,:) = [data51(78, ss:ee), data51(81, ss:ee)];
data51r(21,:) = [data51(84, ss:ee), data51(87, ss:ee)];
data51r(22,:) = [data51(90, ss:ee), data51(91, ss:ee)];
data51r(23,:) = [data51(92, ss:ee), data51(95, ss:ee)];
data51r(24,:) = [data51(98, ss:ee), data51(101, ss:ee)];
data51r(25,:) = [data51(104, ss:ee), data51(107, ss:ee)];
data51r(26,:) = [data51(110, ss:ee), data51(113, ss:ee)];
data51r(27,:) = [data51(116, ss:ee), data51(117, ss:ee)];
data51r(28,:) = [data51(118, ss:ee), data51(121, ss:ee)];
data51r(29,:) = [data51(124, ss:ee), data51(125, ss:ee)];
data51r(30,:) = [data51(126, ss:ee), data51(129, ss:ee)];
data51r(31,:) = [data51(132, ss:ee), data51(135, ss:ee)];
data51r(32,:) = [data51(138, ss:ee), data51(139, ss:ee)];
data51r(33,:) = [data51(140, ss:ee), data51(143, ss:ee)];
data51r(34,:) = [data51(146, ss:ee), data51(149, ss:ee)];
data51r(35,:) = [data51(152, ss:ee), data51(155, ss:ee)];
data51r(36,:) = [data51(158, ss:ee), data51(161, ss:ee)];
data51r(37,:) = [data51(164, ss:ee), data51(167, ss:ee)];
data51r(38,:) = [data51(170, ss:ee), data51(173, ss:ee)];
data51r(39,:) = [data51(176, ss:ee), data51(177, ss:ee)];
data51r(40,:) = [data51(178, ss:ee), data51(179, ss:ee)];
data51r(41,:) = [data51(180, ss:ee), data51(181, ss:ee)];
data51r(42,:) = [data51(182, ss:ee), data51(183, ss:ee)];
data51r(43,:) = [data51(184, ss:ee), data51(185, ss:ee)];
data51r(44,:) = [data51(186, ss:ee), data51(189, ss:ee)];
data51r(45,:) = [data51(192, ss:ee), data51(195, ss:ee)];
data51r(46,:) = [data51(198, ss:ee), data51(201, ss:ee)];
data51r(47,:) = [data51(204, ss:ee), data51(207, ss:ee)];
data51r(48,:) = [data51(210, ss:ee), data51(213, ss:ee)];
data51r(49,:) = [data51(216, ss:ee), data51(219, ss:ee)];
data51r(50,:) = [data51(222, ss:ee), data51(225, ss:ee)];
data51r(51,:) = [data51(228, ss:ee), data51(231, ss:ee)];



% 
% for i=1:14
%     data4r(i,:)=[data4((i-1)*6+2,ss:ee),data4((i-1)*6+3,ss:ee),data4((i-1)*6+4,ss:ee),data4((i-1)*6+5,ss:ee),data4((i-1)*6+6,ss:ee),data4((i-1)*6+7,ss:ee)];
% end
% 
% 
% % print the corresponding index of the node in the network.
% % from row 1-14: 799, 702, 705, 707, 709, 710, 711, 714, 725, 732, 733,
% % 742, 744, 727(PV)
% for i=1:14
%     ll(i, :) = [(i-1) * 6 + 2, (i-1) * 6 + 3, (i-1) * 6 + 4, (i-1) * 6 + 5, (i-1) * 6 + 6, (i-1) * 6 + 7];
% end

% ll

%%


% idx1 = dbscan(data1r,5,10);
% idx1

%idx11 = spectralcluster(data1r,4,'distance','correlation')
%idx4 = dbscan(data4r,1000,10000);
%idx4
%idx41 = spectralcluster(data4r,4,'distance','correlation')



%idx2 = spectralcluster(data2r,4,'distance','correlation')
%idx3 = spectralcluster(data3r,5,'distance','correlation')

%idxn = spectralcluster(datanr,4,'distance','correlation')



%% use voltage

% ss = 200000;
% ee = 300000;

% for i=1:14
%     data1r(i,:)=[data1((i-1)*6+2,ss:ee),data1((i-1)*6+3,ss:ee),data1((i-1)*6+4,ss:ee)];
% end

% for i=1:14
%     data4r(i,:)=[data4((i-1)*6+2,ss:ee),data4((i-1)*6+3,ss:ee),data4((i-1)*6+4,ss:ee)];
% end

% for i=1:14
%     data2r(i,:)=[data2((i-1)*6+2,ss:ee),data2((i-1)*6+3,ss:ee),data2((i-1)*6+4,ss:ee)];
% end
% 
% for i=1:14
%     data3r(i,:)=[data3((i-1)*6+2,ss:ee),data3((i-1)*6+3,ss:ee),data3((i-1)*6+4,ss:ee)];
% end

% 
% for i=1:14
%     datanr(i,:)=[datan((i-1)*6+2,ss:ee),datan((i-1)*6+3,ss:ee),datan((i-1)*6+4,ss:ee)];
% end


%%
% 
% clc
% %idx1 = dbscan(data1r,5,10);
% %idx1
% 
% idx11 = spectralcluster_FL(data1r,4,'distance','correlation');
% idx111 = spectralcluster(data1r,4,'distance','correlation');
% 
% figure
% [s1 h1]= silhouette(data1r,idx11,'cityblock')
% title('case1')
% 
% figure
% [s12 h12]= silhouette(data1r,idx111,'cityblock')
% title('case1 orginal')
%%

%idx4 = dbscan(data4r,1000,10000);
%idx4
clc
close all

idx41 = spectralcluster(data51r,5,'distance','correlation');     
figure
[s1,h1]= silhouette(data51r,idx41,'cosine');

figure
bar(abs(s1))
ylabel('Silhouette Value','FontSize',18)
xlabel('Sensor node #','FontSize',18)
set(gca,'FontSize',15);
ylim([0 1.1])
mean(abs(s1))

%title('case41')

idx42 = spectralcluster_FL(data51r,5,'distance','correlation');
figure
[s2,h2]= silhouette(data51r,idx42,'cosine');

figure
bar(abs(s2))
ylabel('Silhouette Value','FontSize',18)
xlabel('Sensor node #','FontSize',18)
set(gca,'FontSize',15);
ylim([0 1.1])
%title('case42')

mean(abs(s2))



% idx2 = spectralcluster_FL(data2r,4,'distance','correlation')
% 
% figure
% [s h]= silhouette(data2r,idx2)
% title('case2')
% 
% idx3 = spectralcluster_FL(data3r,4,'distance','correlation')
% 
% figure
% [s h]= silhouette(data3r,idx2)
% title('case3')

%%
% 
% idxn = spectralcluster_FL(datanr,4,'distance','correlation')

% figure
% [s h]= silhouette(datanr,idxn)
% title('case normal')



