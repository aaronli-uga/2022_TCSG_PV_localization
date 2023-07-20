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

%%
% This script plots waveform data of every node.
figure
plot(opvar(1,ss:ee),opvar(2:4,ss:ee));
title('voltage of node 1')
figure
plot(opvar(1,:),opvar(5:7,:));
title('current of node 1')

figure
plot(opvar(1,ss:ee),opvar(8,ss:ee));
title('voltage of node 3')
figure
plot(opvar(1,:),opvar(9,:));
title('current of node 3')

figure
plot(opvar(1,ss:ee),opvar(10,ss:ee));
title('voltage of node 5')
figure
plot(opvar(1,:),opvar(11,:));
title('current of node 5')

figure
plot(opvar(1,:),opvar(12:14,:));
title('voltage of node 8')
figure
plot(opvar(1,:),opvar(15:17,:));
title('current of node 8')

%%
figure
plot(opvar(1,:),opvar(18,:));
title('voltage of node 14')
figure
plot(opvar(1,:),opvar(19,:));
title('current of node 14')

figure
plot(opvar(1,:),opvar(20,:));
title('voltage of node 15')
figure
plot(opvar(1,:),opvar(21,:));
title('current of node 15')

figure
plot(opvar(1,:),opvar(22,:));
title('voltage of node 19')
figure
plot(opvar(1,:),opvar(23,:));
title('current of node 19')

figure
plot(opvar(1,:),opvar(24:26,:));
title('voltage of node 21')
figure
plot(opvar(1,:),opvar(27:29,:));
title('current of node 21')

figure
plot(opvar(1,:),opvar(30:32,:));
title('voltage of node 23')
figure
plot(opvar(1,:),opvar(33:35,:));
title('current of node 23')

figure
plot(opvar(1,:),opvar(36,:));
title('voltage of node 27')
figure
plot(opvar(1,:),opvar(37,:));
title('current of node 27')

figure
plot(opvar(1,:),opvar(38:40,:));
title('voltage of node 29')
figure
plot(opvar(1,:),opvar(41:43,:));
title('current of node 29')

figure
plot(opvar(1,:),opvar(44,:));
title('voltage of node 31')
figure
plot(opvar(1,:),opvar(45,:));
title('current of node 31')

figure
plot(opvar(1,:),opvar(46:47,:));
title('voltage of node 36')
figure
plot(opvar(1,:),opvar(48:49,:));
title('current of node 36')

figure
plot(opvar(1,:),opvar(50,:));
title('voltage of node 38')
figure
plot(opvar(1,:),opvar(51,:));
title('current of node 38')

figure
plot(opvar(1,:),opvar(52:54,:));
title('voltage of node 40')
figure
plot(opvar(1,:),opvar(55:57,:));
title('current of node 40')

figure
plot(opvar(1,:),opvar(58:60,:));
title('voltage of node 42')
figure
plot(opvar(1,:),opvar(61:63,:));
title('current of node 42')

figure
plot(opvar(1,:),opvar(64,:));
title('voltage of node 45')
figure
plot(opvar(1,:),opvar(65,:));
title('current of node 45')

figure
plot(opvar(1,:),opvar(66:68,:));
title('voltage of node 47')
figure
plot(opvar(1,:),opvar(69:71,:));
title('current of node 47')

figure
plot(opvar(1,:),opvar(72:74,:));
title('voltage of node 50')
figure
plot(opvar(1,:),opvar(75:77,:));
title('current of node 50')

figure
plot(opvar(1,:),opvar(78:80,:));
title('voltage of node 53')
figure
plot(opvar(1,:),opvar(81:83,:));
title('current of node 53')

figure
plot(opvar(1,:),opvar(84:86,:));
title('voltage of node 55')
figure
plot(opvar(1,:),opvar(87:89,:));
title('current of node 55')

figure
plot(opvar(1,:),opvar(90,:));
title('voltage of node 58')
figure
plot(opvar(1,:),opvar(91,:));
title('current of node 58')

figure
plot(opvar(1,:),opvar(92:94,:));
title('voltage of node 60')
figure
plot(opvar(1,:),opvar(95:97,:));
title('current of node 60')

figure
plot(opvar(1,:),opvar(98:100,:));
title('voltage of node 62')
figure
plot(opvar(1,:),opvar(101:103,:));
title('current of node 62')

figure
plot(opvar(1,:),opvar(104:106,:));
title('voltage of node 65')
figure
plot(opvar(1,:),opvar(107:109,:));
title('current of node 65')

figure
plot(opvar(1,:),opvar(110:112,:));
title('voltage of node 67')
figure
plot(opvar(1,:),opvar(113:115,:));
title('current of node 67')

figure
plot(opvar(1,:),opvar(116,:));
title('voltage of node 70')
figure
plot(opvar(1,:),opvar(117,:));
title('current of node 70')

figure
plot(opvar(1,:),opvar(118:120,:));
title('voltage of node 72')
figure
plot(opvar(1,:),opvar(121:123,:));
title('current of node 72')

figure
plot(opvar(1,:),opvar(124,:));
title('voltage of node 74')
figure
plot(opvar(1,:),opvar(125,:));
title('current of node 74')

figure
plot(opvar(1,:),opvar(126:128,:));
title('voltage of node 78')
figure
plot(opvar(1,:),opvar(129:131,:));
title('current of node 78')

figure
plot(opvar(1,:),opvar(132:134,:));
title('voltage of node 82')
figure
plot(opvar(1,:),opvar(135:137,:));
title('current of node 82')

figure
plot(opvar(1,:),opvar(138,:));
title('voltage of node 84')
figure
plot(opvar(1,:),opvar(139,:));
title('current of node 84')

figure
plot(opvar(1,:),opvar(140:142,:));
title('voltage of node 87')
figure
plot(opvar(1,:),opvar(143:145,:));
title('current of node 87')

figure
plot(opvar(1,:),opvar(146:148,:));
title('voltage of node 89')
figure
plot(opvar(1,:),opvar(149:151,:));
title('current of node 89')

figure
plot(opvar(1,:),opvar(152:154,:));
title('voltage of node 91')
figure
plot(opvar(1,:),opvar(155:157,:));
title('current of node 91')

figure
plot(opvar(1,:),opvar(158:160,:));
title('voltage of node 93')
figure
plot(opvar(1,:),opvar(161:163,:));
title('current of node 93')

figure
plot(opvar(1,:),opvar(164:166,:));
title('voltage of node 95')
figure
plot(opvar(1,:),opvar(167:169,:));
title('current of node 95')

figure
plot(opvar(1,:),opvar(170:172,:));
title('voltage of node 99')
figure
plot(opvar(1,:),opvar(173:175,:));
title('current of node 99')

figure
plot(opvar(1,:),opvar(176,:));
title('voltage of node 103')
figure
plot(opvar(1,:),opvar(177,:));
title('current of node 103')

figure
plot(opvar(1,:),opvar(178,:));
title('voltage of node 105')
figure
plot(opvar(1,:),opvar(179,:));
title('current of node 105')

figure
plot(opvar(1,:),opvar(180,:));
title('voltage of node 106')
figure
plot(opvar(1,:),opvar(181,:));
title('current of node 106')

figure
plot(opvar(1,:),opvar(182,:));
title('voltage of node 110')
figure
plot(opvar(1,:),opvar(183,:));
title('current of node 110')

figure
plot(opvar(1,:),opvar(184,:));
title('voltage of node 113')
figure
plot(opvar(1,:),opvar(185,:));
title('current of node 113')

figure
plot(opvar(1,:),opvar(186:188,:));
title('voltage of node 135')
figure
plot(opvar(1,:),opvar(189:191,:));
title('current of node 135')

figure
plot(opvar(1,:),opvar(192:194,:));
title('voltage of node 149')
figure
plot(opvar(1,:),opvar(195:197,:));
title('current of node 149')

figure
plot(opvar(1,:),opvar(198:200,:));
title('voltage of node 152')
figure
plot(opvar(1,:),opvar(201:203,:));
title('current of node 152')

figure
plot(opvar(1,:),opvar(204:206,:));
title('voltage of node 160')
figure
plot(opvar(1,:),opvar(207:209,:));
title('current of node 160')

figure
plot(opvar(1,:),opvar(210:212,:));
title('voltage of node 197')
figure
plot(opvar(1,:),opvar(213:215,:));
title('current of node 197')

figure
plot(opvar(1,:),opvar(216:218,:));
title('voltage of node 250')
figure
plot(opvar(1,:),opvar(219:221,:));
title('current of node 250')

figure
plot(opvar(1,:),opvar(222:224,:));
title('voltage of node 300')
figure
plot(opvar(1,:),opvar(225:227,:));
title('current of node 300')

figure
plot(opvar(1,:),opvar(228:230,:));
title('voltage of node 450')
figure
plot(opvar(1,:),opvar(231:233,:));
title('current of node 450')
