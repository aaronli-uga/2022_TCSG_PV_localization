clear
close all
clc

%test the clustering

load case1

data1 = opvar;

load case2

data2 = opvar;

load case3

data3 = opvar;

load case4

data4 = opvar;

load normalcase

datan = opvar;

%%

ss = 200000;
ee = 300000;

for i=1:14
    data1r(i,:)=[data1((i-1)*6+2,ss:ee),data1((i-1)*6+3,ss:ee),data1((i-1)*6+4,ss:ee),data1((i-1)*6+5,ss:ee),data1((i-1)*6+6,ss:ee),data1((i-1)*6+7,ss:ee)];
end

for i=1:14
    data4r(i,:)=[data4((i-1)*6+2,ss:ee),data4((i-1)*6+3,ss:ee),data4((i-1)*6+4,ss:ee),data4((i-1)*6+5,ss:ee),data4((i-1)*6+6,ss:ee),data4((i-1)*6+7,ss:ee)];
end

for i=1:14
    data2r(i,:)=[data2((i-1)*6+2,ss:ee),data2((i-1)*6+3,ss:ee),data2((i-1)*6+4,ss:ee),data2((i-1)*6+5,ss:ee),data2((i-1)*6+6,ss:ee),data2((i-1)*6+7,ss:ee)];
end

for i=1:14
    data3r(i,:)=[data3((i-1)*6+2,ss:ee),data3((i-1)*6+3,ss:ee),data3((i-1)*6+4,ss:ee),data3((i-1)*6+5,ss:ee),data3((i-1)*6+6,ss:ee),data3((i-1)*6+7,ss:ee)];
end


for i=1:14
    datanr(i,:)=[datan((i-1)*6+2,ss:ee),datan((i-1)*6+3,ss:ee),datan((i-1)*6+4,ss:ee),datan((i-1)*6+5,ss:ee),datan((i-1)*6+6,ss:ee),datan((i-1)*6+7,ss:ee)];
end


%%

clc
%idx1 = dbscan(data1r,5,10);
%idx1

%idx11 = spectralcluster(data1r,4,'distance','correlation')
%idx4 = dbscan(data4r,1000,10000);
%idx4
%idx41 = spectralcluster(data4r,4,'distance','correlation')



idx2 = spectralcluster(data2r,4,'distance','correlation')
%idx3 = spectralcluster(data3r,5,'distance','correlation')

%idxn = spectralcluster(datanr,4,'distance','correlation')



%% use voltage

ss = 200000;
ee = 300000;

for i=1:14
    data1r(i,:)=[data1((i-1)*6+2,ss:ee),data1((i-1)*6+3,ss:ee),data1((i-1)*6+4,ss:ee)];
end

for i=1:14
    data4r(i,:)=[data4((i-1)*6+2,ss:ee),data4((i-1)*6+3,ss:ee),data4((i-1)*6+4,ss:ee)];
end

for i=1:14
    data2r(i,:)=[data2((i-1)*6+2,ss:ee),data2((i-1)*6+3,ss:ee),data2((i-1)*6+4,ss:ee)];
end

for i=1:14
    data3r(i,:)=[data3((i-1)*6+2,ss:ee),data3((i-1)*6+3,ss:ee),data3((i-1)*6+4,ss:ee)];
end


for i=1:14
    datanr(i,:)=[datan((i-1)*6+2,ss:ee),datan((i-1)*6+3,ss:ee),datan((i-1)*6+4,ss:ee)];
end


%%

clc
%idx1 = dbscan(data1r,5,10);
%idx1

idx11 = spectralcluster_FL(data1r,4,'distance','correlation');
idx111 = spectralcluster(data1r,4,'distance','correlation');

figure
[s1 h1]= silhouette(data1r,idx11,'cityblock')
title('case1')

figure
[s12 h12]= silhouette(data1r,idx111,'cityblock')
title('case1 orginal')
%%

%idx4 = dbscan(data4r,1000,10000);
%idx4
idx41 = spectralcluster_FL(data4r,4,'distance','correlation')
figure
[s h]= silhouette(data4r,idx41)
title('case4')


idx2 = spectralcluster_FL(data2r,4,'distance','correlation')

figure
[s h]= silhouette(data2r,idx2)
title('case2')

idx3 = spectralcluster_FL(data3r,4,'distance','correlation')

figure
[s h]= silhouette(data3r,idx2)
title('case3')

%%

idxn = spectralcluster_FL(datanr,4,'distance','correlation')

% figure
% [s h]= silhouette(datanr,idxn)
% title('case normal')

%% use current

ss = 200000;
ee = 300000;

for i=1:14
    data1r(i,:)=[data1((i-1)*6+5,ss:ee),data1((i-1)*6+6,ss:ee),data1((i-1)*6+7,ss:ee)];
end

for i=1:14
    data2r(i,:)=[data2((i-1)*6+5,ss:ee),data2((i-1)*6+6,ss:ee),data2((i-1)*6+7,ss:ee)];
end

for i=1:14
    data4r(i,:)=[data4((i-1)*6+5,ss:ee),data4((i-1)*6+6,ss:ee),data4((i-1)*6+7,ss:ee)];
end

for i=1:14
    data3r(i,:)=[data3((i-1)*6+5,ss:ee),data3((i-1)*6+6,ss:ee),data3((i-1)*6+7,ss:ee)];
end


for i=1:14
    datanr(i,:)=[datan((i-1)*6+5,ss:ee),datan((i-1)*6+6,ss:ee),datan((i-1)*6+7,ss:ee)];
end


%%

clc

idxn = spectralcluster(datanr,4,'distance','correlation')
%idx1 = spectralcluster(data1r,4,'distance','correlation')
%idx2 = spectralcluster(data2r,4,'distance','correlation')
%idx3 = spectralcluster(data3r,4,'distance','correlation')
%idx4 = spectralcluster(data4r,4,'distance','correlation')

