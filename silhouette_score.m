%silhouette testing

clear
close all
clc

load case1

data4 = opvar;


%%

% ss = 200000;
% ee = 300000;
% 
% 
% 
% for i=1:14
%     data4r(i,:)=[data4((i-1)*6+2,ss:ee),data4((i-1)*6+3,ss:ee),data4((i-1)*6+4,ss:ee),data4((i-1)*6+5,ss:ee),data4((i-1)*6+6,ss:ee),data4((i-1)*6+7,ss:ee)];
% end



%%


%idx1 = dbscan(data1r,5,10);
%idx1

%idx11 = spectralcluster(data1r,4,'distance','correlation')
%idx4 = dbscan(data4r,1000,10000);
%idx4
%idx41 = spectralcluster(data4r,4,'distance','correlation')



%idx2 = spectralcluster(data2r,4,'distance','correlation')
%idx3 = spectralcluster(data3r,5,'distance','correlation')

%idxn = spectralcluster(datanr,4,'distance','correlation')



%% use voltage

ss = 200000;
ee = 300000;

% for i=1:14
%     data1r(i,:)=[data1((i-1)*6+2,ss:ee),data1((i-1)*6+3,ss:ee),data1((i-1)*6+4,ss:ee)];
% end

for i=1:14
    data4r(i,:)=[data4((i-1)*6+2,ss:ee),data4((i-1)*6+3,ss:ee),data4((i-1)*6+4,ss:ee)];
end

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

idx41 = spectralcluster(data4r,4,'distance','correlation');
figure
[s1 h1]= silhouette(data4r,idx41,'cosine');

figure
bar(abs(s1))
ylabel('Silhouette Value','FontSize',18)
xlabel('Sensor node #','FontSize',18)
set(gca,'FontSize',15);
ylim([0 1.1])
mean(abs(s1))

%title('case41')

idx42 = spectralcluster_FL(data4r,4,'distance','correlation');
figure
[s2 h2]= silhouette(data4r,idx42,'cosine');

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



