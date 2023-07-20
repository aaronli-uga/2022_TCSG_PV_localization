%% PV farm current analysis
load('normalcase.mat');
current_PV_normal = opvar(83:85,1:600000);
load('island.mat');
current_PV_island = opvar(83:85,1:600000);
load('case1.mat');
current_PV_caseone = opvar(83:85,1:600000);
load('case2.mat');
current_PV_casetwo = opvar(83:85,1:600000);
load('case3.mat');
current_PV_casethree = opvar(83:85,1:600000);
load('case4.mat');
current_PV_casefour = opvar(83:85,1:600000);
% current_pu_normal = abs(current_PV_normal)./abs(current_PV_normal);
% current_pu_island = abs(current_PV_island)./abs(current_PV_normal);
% plot(opvar(1,1:600000),current_PV_normal)
% hold on
% plot(opvar(1,1:600000),current_PV_island)

%% normal spectrum
j = 1;
spec_normal = zeros(59,20000);
mag_spec_normal = zeros(59,10000);
for i = 0:10000:580000
interval_normal = current_PV_normal(1,i+1:i+20000).*hamming(20000)';
spec_normal(j,:) = fft(interval_normal,20000);
mag_spec_normal(j,:) = abs(spec_normal(j,2:10001));
j = j+1;
end
figure
newmag_normal = mag_spec_normal;
newmag_normal(:,55:65) = 0; 
plot(1:10000,newmag_normal);
title('normal current');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_normal);
title('3D normal current');
%% island spectrum
j = 1;
spec_island = zeros(59,20000);
mag_spec_island = zeros(59,10000);
for i = 0:10000:580000
interval_island = current_PV_island(1,i+1:i+20000).*hamming(20000)';
spec_island(j,:) = fft(interval_island,20000);
mag_spec_island(j,:) = abs(spec_island(j,2:10001));
j = j+1;
end
figure
newmag_island = mag_spec_island;
newmag_island(:,55:65) = 0; 
plot(1:10000,newmag_island);
title('island current');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_island);
title('3D island current');
%% case1
j = 1;
spec_caseone = zeros(59,20000);
mag_spec_caseone = zeros(59,10000);
for i = 0:10000:580000
interval_caseone = current_PV_caseone(1,i+1:i+20000).*hamming(20000)';
spec_caseone(j,:) = fft(interval_caseone,20000);
mag_spec_caseone(j,:) = abs(spec_caseone(j,2:10001));
j = j+1;
end
figure
newmag_caseone = mag_spec_caseone;
newmag_caseone(:,55:65) = 0; 
plot(1:10000,newmag_caseone);
title('case1 current');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_caseone);
title('3D case1 current');
%% case2
j = 1;
spec_casetwo = zeros(59,20000);
mag_spec_casetwo = zeros(59,10000);
for i = 0:10000:580000
interval_casetwo = current_PV_casetwo(1,i+1:i+20000).*hamming(20000)';
spec_casetwo(j,:) = fft(interval_casetwo,20000);
mag_spec_casetwo(j,:) = abs(spec_casetwo(j,2:10001));
j = j+1;
end
figure
newmag_casetwo = mag_spec_casetwo;
newmag_casetwo(:,55:65) = 0; 
plot(1:10000,newmag_casetwo);
title('case2 current');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_casetwo);
title('3D case2 current');
%% case3
j = 1;
spec_casethree = zeros(59,20000);
mag_spec_casethree = zeros(59,10000);
for i = 0:10000:580000
interval_casethree = current_PV_casethree(1,i+1:i+20000).*hamming(20000)';
spec_casethree(j,:) = fft(interval_casethree,20000);
mag_spec_casethree(j,:) = abs(spec_casethree(j,2:10001));
j = j+1;
end
figure
newmag_casethree = mag_spec_casethree;
newmag_casethree(:,55:65) = 0; 
plot(1:10000,newmag_casethree);
title('case3 current');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_casethree);
title('3D case3 current');
%% case4
j = 1;
spec_casefour = zeros(59,20000);
mag_spec_casefour = zeros(59,10000);
for i = 0:10000:580000
interval_casefour = current_PV_casefour(1,i+1:i+20000).*hamming(20000)';
spec_casefour(j,:) = fft(interval_casefour,20000);
mag_spec_casefour(j,:) = abs(spec_casefour(j,2:10001));
j = j+1;
end
figure
newmag_casefour = mag_spec_casefour;
newmag_casefour(:,55:65) = 0; 
plot(1:10000,newmag_casefour);
title('case4 current');
figure
[X,Y]=meshgrid(0:0.5:29,1:10000);
plot3(X,Y,newmag_casefour);
title('3D case4 current');