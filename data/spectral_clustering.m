% This script tries to implement the spectral clustering method.
clear
close all
clc

% load attack/fault data
load('case2.mat')

fs = 20000;
stime = fs * 8;
etime = fs * 8.5;

% Signal matrix
window_time = opvar(1, stime:etime);
sigMatrix = [opvar(5, stime:etime)', opvar(11, stime:etime)', ...
    opvar(17, stime:etime)', opvar(23, stime:etime)', ...
    opvar(29, stime:etime)', opvar(35, stime:etime)', ...
    opvar(41, stime:etime)', opvar(47, stime:etime)', ...
    opvar(53, stime:etime)', opvar(83, stime:etime)', ...
    opvar(59, stime:etime)', opvar(65, stime:etime)', ...
    opvar(71, stime:etime)', opvar(77, stime:etime)', ...
    opvar(89, stime:etime)'];

for i = 1:15
    bbb(:,i) = opvar((i-1)*6 + 5, stime:etime)';
end

% topology matrix
% 799 702 705 707 709 710 711 714 725 727 732 733 742 744 der2744 
% 1    2   3   4   5   6   7   8   9   10  11  12  13  14  15

% indirect connection weight
iW = 0.5;

% topologyMatrix = [0,iW,0,0,0,0,0,0,0,0,0,0,0,0,0; ...
%     iW, 0, 1, iW, 0, 0, 0, iW, iW, 0, 0, 0, 0, 0, 0; ...
%     0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0; ...
%     0, iW, 0, 0, 0, 0, 0, iW, iW, 0, 0, 0, 0, 0, 0; ...
%     0, iW, 0, 0, 0, 0, 0, 0, 0, iW, iW, iW, 0, 0, 0; ...
%     0, 0, 0, 0, 0, 0, iW, 0, 0, 0, 0, iW, 0, 0, 0; ...
%     0, 0, 0, 0, 0, iW, 0, 0, 0, 0, 0, iW, 0, 0, 0; ...
%     0, iW, 0, iW, 0, 0, 0, 0, iW, 0, 0, 0, 0, 0, 0; ...
%     0, iW, 0, iW, 0, 0, 0, iW, 0, 0, 0, 0, 0, 0, 0; ...
%     0, iW, 0, 0, iW, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0; ...
%     0, 0, 0, 0, iW, 0, 0, 0, 0, 0, 0, iW, 0, 0, 0; ...
%     0, 0, 0, 0, iW, iW, iW, 0, 0, 0, iW, 0, 0, 0, 0; ...
%     0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; ...
%     0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1; ...
%     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0;];
tM = zeros(15);
tM(1,2) = iW;
tM(2,1) = iW;
tM(2,3) = 1;
tM(2,4) = iW;
tM(2,8) = iW;
tM(2,9) = iW;
tM(3,2) = 1;
tM(3,13) = 1;
tM(4,2) = iW;
tM(4,8) = iW;
tM(4,9) = iW;
tM(5,2) = iW;
tM(5,10) = iW;
tM(5,11) = iW;
tM(5,12) = iW;
tM(6,7) = iW;
tM(6,12) = iW;
tM(7,6) = iW;
tM(7,12) = iW;
tM(8,2) = iW;
tM(8,4) = iW;
tM(8,9) = iW;
tM(9,2) = iW;
tM(9,4) = iW;
tM(9,8) = iW;
tM(10,2) = iW;
tM(10,5) = iW;
tM(10,14) = 1;
tM(11,5) = iW;
tM(11,12) = iW;
tM(12,5) = iW;
tM(12,6) = iW;
tM(12,7) = iW;
tM(12,11) = iW;
tM(13,3) = 1;
tM(14,10) = 1;
tM(14,15) = 1;
tM(15,14) = 1;





% 
% sig2 = opvar(89,stime:etime); % 727
% % sig1 = opvar(35,stime:etime); % 732
% sig1 = opvar(23,stime:etime); % 727
% % sig = opvar(59,stime:etime); % 732
% % sig = opvar(23,stime:etime); % 707
% % sig = opvar(35,stime:etime); % 710

% corrcoef(sig1,sig2)

