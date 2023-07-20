clc;clear;close all
%% parameter setting
f_s=20000;%sampling rate kHz
t_s=1/f_s;%sampling time [sec] 
samp_rate=167;%120Hz  167=20kHz/120Hz
windowsize=3000;%1024*3
%% Normal
load data_file/grid_data/grid_normal 
data_grid_normal=gridvoltage(:,1:800000);
load data_file/grid_data/grid_normal_tem.mat
data_grid_normal_tem=gridvoltage(:,1:800000);
load data_file/grid_data/grid_irradiance
data_grid_irradiance=gridvoltage(:,1:800000);
load data_file/grid_data/grid_irradiancenew.mat
data_grid_irradiance_new=gridvoltage(:,1:800000);
%% Single DIA A01...A08 -- 1-8 (3 and 7 are not used)
load data_file/grid_data/grid_attack1 
data_grid_attack1=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack2 
data_grid_attack2=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack3% not use
data_grid_attack3=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack4 
data_grid_attack4=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack5 
data_grid_attack5=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack6 
data_grid_attack6=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack7% not use
data_grid_attack7=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack8 
data_grid_attack8=gridvoltage(:,1:800000);
%% Single DIA A09...A16 14-20,24
load data_file/grid_data/grid_attack14
data_grid_attack14=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack15 
data_grid_attack15=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack16 
data_grid_attack16=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack17 
data_grid_attack17=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack18 
data_grid_attack18=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack19
data_grid_attack19=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack20
data_grid_attack20=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack24 
data_grid_attack24=gridvoltage(:,1:800000);
%% Coordinated DIA A17...A24  9-13,21,22,23
load data_file/grid_data/grid_attack9  
data_grid_attack9=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack10 
data_grid_attack10=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack11 
data_grid_attack11=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack12
data_grid_attack12=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack13 
data_grid_attack13=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack21
data_grid_attack21=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack22
data_grid_attack22=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack23
data_grid_attack23=gridvoltage(:,1:800000);
%% Coordinated DIA A25 ... A28  25,26,33,36
load data_file/grid_data/grid_attack25%**
data_grid_attack25=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack26%**
data_grid_attack26=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack33%**
data_grid_attack33=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack36%**
data_grid_attack36=gridvoltage(:,1:800000);
%% Replay attack A29, A30 -- 27,45
load data_file/grid_data/grid_attack27
data_grid_attack27=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack45
data_grid_attack45=gridvoltage(:,1:800000);
%% Short-circuit fault A Fs1 and Fs2  46,59
load data_file/grid_data/grid_attack46
data_grid_attack46=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack59
data_grid_attack59=gridvoltage(:,1:800000);
%% Short-circuit fault AB Fs3 ... Fs7  39,48,49,53,56
load data_file/grid_data/grid_attack39
data_grid_attack39=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack48
data_grid_attack48=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack49
data_grid_attack49=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack53
data_grid_attack53=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack56
data_grid_attack56=gridvoltage(:,1:800000);
%% Short-circuit fault AC Fs8 ... Fs12 -- 51,52,57,58,47
load data_file/grid_data/grid_attack51
data_grid_attack51=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack52
data_grid_attack52=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack57
data_grid_attack57=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack58
data_grid_attack58=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack47
data_grid_attack47=gridvoltage(:,1:800000);
%% Short-circuit fault ABC Fs13 ... Fs15 -- 50,54,55
load data_file/grid_data/grid_attack50
data_grid_attack50=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack54
data_grid_attack54=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack55
data_grid_attack55=gridvoltage(:,1:800000);
%% Open-circuit fault FO1 ... FO4 -- 31,60,61,62
load data_file/grid_data/grid_attack31
data_grid_attack31=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack60
data_grid_attack60=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack61
data_grid_attack61=gridvoltage(:,1:800000);
load data_file/grid_data/grid_attack62
data_grid_attack62=gridvoltage(:,1:800000);
%% plot current and voltage
% data_plot=data_grid_attack31;
% plot(data_plot(1,:),data_plot(2,:));hold on
% plot(data_plot(1,:),data_plot(3,:));hold on
% plot(data_plot(1,:),data_plot(4,:));figure
% plot(data_plot(1,:),data_plot(5,:));hold on
% plot(data_plot(1,:),data_plot(6,:));hold on
% plot(data_plot(1,:),data_plot(7,:));
%% calculate BarRm, BarPmcv, BarRf, and BarT
data_fft=data_grid_normal;%data_grid_normal
signal=2;%features for Ua
[~,~,~,time_rec]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
%--------------------------------------------------------------------------
display('normal')
data_fft=data_grid_normal;%data_grid_normal
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end 
train_normal=data_pre_fft;%data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
%-------------------------------------------------------------------
display('normal_tem')
data_fft=data_grid_normal_tem;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_normal_tem=data_pre_fft;
%-------------------------------------------------------------------
display('irradiance')
data_fft=data_grid_irradiance;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_irradiance=data_pre_fft;
%-------------------------------------------------------------------
display('irradiance_new')
data_fft=data_grid_irradiance_new;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_irradiance_new=data_pre_fft;
%% Single DIA A01...A08    data_grid_attack1-8
%-------------------------------------------------------------------
display('attack = 1')
data_fft=data_grid_attack1;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack1=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 2')
data_fft=data_grid_attack2;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack2=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 3')
data_fft=data_grid_attack3;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack3=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 4')
data_fft=data_grid_attack4;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack4=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 5')
data_fft=data_grid_attack5;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack5=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 6')
data_fft=data_grid_attack6;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack6=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 7')
data_fft=data_grid_attack7;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack7=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 8')
data_fft=data_grid_attack8;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack8=data_pre_fft;
%% Single DIA A09...A16 14-20,24
%-------------------------------------------------------------------
display('attack = 14')
data_fft=data_grid_attack14;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack14=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 15')
data_fft=data_grid_attack15;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack15=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 16')
data_fft=data_grid_attack16;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack16=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 17')
data_fft=data_grid_attack17;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack17=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 18')
data_fft=data_grid_attack18;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack18=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 19')
data_fft=data_grid_attack19;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack19=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 20')
data_fft=data_grid_attack20;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack20=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 24')
data_fft=data_grid_attack24;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack24=data_pre_fft;
%% Coordinated DIA A17...A24  9-13,21,22,23
%-------------------------------------------------------------------
display('attack = 9')
data_fft=data_grid_attack9;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack9=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 10')
data_fft=data_grid_attack10;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack10=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 11')
data_fft=data_grid_attack11;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack11=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 12')
data_fft=data_grid_attack12;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack12=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 13')
data_fft=data_grid_attack13;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack13=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 21')
data_fft=data_grid_attack21;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack21=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 22')
data_fft=data_grid_attack22;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack22=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 23')
data_fft=data_grid_attack23;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack23=data_pre_fft;
%% Coordinated DIA A25 ... A28  25,26,33,36
display('attack = 25')
data_fft=data_grid_attack25;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack25=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 26')
data_fft=data_grid_attack26;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack26=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 33')
data_fft=data_grid_attack33;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack33=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 36')
data_fft=data_grid_attack36;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack36=data_pre_fft;
%% Replay attack A29, A30 -- 27,45
%-------------------------------------------------------------------
display('attack = 27')
data_fft=data_grid_attack27;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack27=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 45')
data_fft=data_grid_attack45;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack45=data_pre_fft;
%% Short-circuit fault A Fs1 and Fs2 -- 46,59
display('attack = 46')
data_fft=data_grid_attack46;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack46=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 59')
data_fft=data_grid_attack59;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack59=data_pre_fft;
%% Short-circuit fault AB Fs3 ... Fs7 -- 39,48,49,53,56
display('attack = 39')
data_fft=data_grid_attack39;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack39=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 48')
data_fft=data_grid_attack48;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack48=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 49')
data_fft=data_grid_attack49;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack49=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 53')
data_fft=data_grid_attack53;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack53=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 56')
data_fft=data_grid_attack56;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack56=data_pre_fft;
%% Short-circuit fault AC Fs8 ... Fs12 -- 51,52,57,58,47
%-------------------------------------------------------------------
display('attack = 51')
data_fft=data_grid_attack51;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack51=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 52')
data_fft=data_grid_attack52;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack52=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 57')
data_fft=data_grid_attack57;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack57=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 58')
data_fft=data_grid_attack58;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack58=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 47')
data_fft=data_grid_attack47;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack47=data_pre_fft;
%% Short-circuit fault ABC Fs13 ... Fs15 -- 50,54,55
%-------------------------------------------------------------------
display('attack = 50')
data_fft=data_grid_attack50;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack50=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 54')
data_fft=data_grid_attack54;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack54=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 55')
data_fft=data_grid_attack55;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack55=data_pre_fft;
%% Open-circuit fault FO1 ... FO4 -- 31,60,61,62
%-------------------------------------------------------------------
display('attack = 31')
data_fft=data_grid_attack31;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack31=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 60')
data_fft=data_grid_attack60;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack60=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 61')
data_fft=data_grid_attack61;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack61=data_pre_fft;
%-------------------------------------------------------------------
display('attack = 62')
data_fft=data_grid_attack62;%original data
data_pre_fft(1,:)=time_rec;%the first line is the record time
for signal=2:7 %signal 2,3,4=Ua,Ub,Uc; 5,6,7=Ia,Ib,Ic;
    [amp,freq,thd,~]=fun_fft(data_fft,f_s,windowsize,signal,samp_rate);
    data_pre_fft(signal,:)=amp;data_pre_fft(signal+6,:)=freq;data_pre_fft(signal+12,:)=thd;
end %data_pre_fft = amp 6X1--2:7; freq 6X1--8:13; thd 6X1--14:19
train_attack62=data_pre_fft;
%% train_dataset=save .mat




















