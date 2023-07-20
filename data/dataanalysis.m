%% PV farm voltage analysis
load('normalcase.mat');
voltage_PV_normal = opvar(80:82,1:600000);
load('island.mat');
voltage_PV_island = opvar(80:82,1:600000);
load('case1.mat');
voltage_PV_caseone = opvar(80:82,1:600000);
load('case2.mat');
voltage_PV_casetwo = opvar(80:82,1:600000);
load('case3.mat');
voltage_PV_casethree = opvar(80:82,1:600000);
load('case4.mat');
voltage_PV_casefour = opvar(80:82,1:600000);
% voltage_pu_normal = abs(voltage_PV_normal)./abs(voltage_PV_normal);
% voltage_pu_island = abs(voltage_PV_island)./abs(voltage_PV_normal);
% plot(opvar(1,1:600000),voltage_PV_normal)
% hold on
% plot(opvar(1,1:600000),voltage_PV_island)

%% normal spectrum
j = 1;
spec_normal = zeros(59,20000);
mag_spec_normal = zeros(59,10000);
for i = 0:10000:580000
interval_normal = voltage_PV_normal(1,i+1:i+20000).*hamming(20000)';
spec_normal(j,:) = fft(interval_normal,20000);
mag_spec_normal(j,:) = abs(spec_normal(j,2:10001));
j = j+1;
end
figure
newmag_normal = mag_spec_normal;
newmag_normal(:,55:65) = 0; 
plot(1:10000,newmag_normal);
title('normal voltage');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_normal);
title('3D normal voltage');
%% island spectrum
j = 1;
spec_island = zeros(59,20000);
mag_spec_island = zeros(59,10000);
for i = 0:10000:580000
interval_island = voltage_PV_island(1,i+1:i+20000).*hamming(20000)';
spec_island(j,:) = fft(interval_island,20000);
mag_spec_island(j,:) = abs(spec_island(j,2:10001));
j = j+1;
end
figure
newmag_island = mag_spec_island;
newmag_island(:,55:65) = 0; 
plot(1:10000,newmag_island);
title('island voltage');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_island);
title('3D island voltage');
%% case1
j = 1;
spec_caseone = zeros(59,20000);
mag_spec_caseone = zeros(59,10000);
for i = 0:10000:580000
interval_caseone = voltage_PV_caseone(1,i+1:i+20000).*hamming(20000)';
spec_caseone(j,:) = fft(interval_caseone,20000);
mag_spec_caseone(j,:) = abs(spec_caseone(j,2:10001));
j = j+1;
end
figure
newmag_caseone = mag_spec_caseone;
newmag_caseone(:,55:65) = 0; 
plot(1:10000,newmag_caseone);
title('case1 voltage');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_caseone);
title('3D case1 voltage');
%% case2
j = 1;
spec_casetwo = zeros(59,20000);
mag_spec_casetwo = zeros(59,10000);
for i = 0:10000:580000
interval_casetwo = voltage_PV_casetwo(1,i+1:i+20000).*hamming(20000)';
spec_casetwo(j,:) = fft(interval_casetwo,20000);
mag_spec_casetwo(j,:) = abs(spec_casetwo(j,2:10001));
j = j+1;
end
figure
newmag_casetwo = mag_spec_casetwo;
newmag_casetwo(:,55:65) = 0; 
plot(1:10000,newmag_casetwo);
title('case2 voltage');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_casetwo);
title('3D case2 voltage');
%% case3
j = 1;
spec_casethree = zeros(59,20000);
mag_spec_casethree = zeros(59,10000);
for i = 0:10000:580000
interval_casethree = voltage_PV_casethree(1,i+1:i+20000).*hamming(20000)';
spec_casethree(j,:) = fft(interval_casethree,20000);
mag_spec_casethree(j,:) = abs(spec_casethree(j,2:10001));
j = j+1;
end
figure
newmag_casethree = mag_spec_casethree;
newmag_casethree(:,55:65) = 0; 
plot(1:10000,newmag_casethree);
title('case3 voltage');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_casethree);
title('3D case3 voltage');
%% case4
j = 1;
spec_casefour = zeros(59,20000);
mag_spec_casefour = zeros(59,10000);
for i = 0:10000:580000
interval_casefour = voltage_PV_casefour(1,i+1:i+20000).*hamming(20000)';
spec_casefour(j,:) = fft(interval_casefour,20000);
mag_spec_casefour(j,:) = abs(spec_casefour(j,2:10001));
j = j+1;
end
figure
newmag_casefour = mag_spec_casefour;
newmag_casefour(:,55:65) = 0; 
plot(1:10000,newmag_casefour);
title('case4 voltage');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_casefour);
title('3D case4 voltage');