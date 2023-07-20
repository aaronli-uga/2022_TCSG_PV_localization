% This script calculate the proposed instantaneous frequency.
clear
close all
clc

t = 0:0.001:1;
fs = 1000;

sig = sin(t*2*pi*20);
sig = sig .*[ones(300,1);0.2*ones(400,1);ones(301,1)]';


figure
plot(t,sig)
xlim([0 1])
ylim([-1.2 1.2])
xlabel('Time (s)')
ylabel('Amplitude')

%%

z = hilbert(sig);
instfrq = fs/(2*pi)*diff(unwrap(angle(z)));

figure
plot(t(2:end),instfrq)
ylim([0 50])
xlabel('Time (s)')
ylabel('Frequency (Hz)')
title 'Hilbert transform based method'

%%
ins_frq=instfreq(sig,t);

figure
plot(1/30:1/30:1,ins_frq)
ylim([0 50])
xlabel('Time (s)')
ylabel('Frequency (Hz)')
title 'STFT based method'


%%

[sst,f] = fsst(hilbert(sig),fs);

penval = 0;

fridge = tfridge(sst,f,penval,'NumRidges',1);

figure
plot(t,fridge)
ylim([0 50])
xlim([0 1])
xlabel('Time (s)')
ylabel('Frequency (Hz)')
title 'SST based method'

%%

t = 0:0.001:1;
fs = 1000;

sig = sin(t*2*pi*20);
sig = sig .*[ones(300,1);0.2*ones(400,1);ones(301,1)]';

tsig = sig.*tukeywin(length(sig),0.5)';

[sst,f] = fsst(tsig,fs,hamming(1001));

penval = 0;

fridge = tfridge(sst,f,penval,'NumRidges',1);


%tfridge = fridge.*tukeywin(length(fridge),0.05);

figure
plot(t,fridge)
ylim([0 50])
xlim([0 1])
xlabel('Time (s)')
ylabel('Frequency (Hz)')
title 'Tappered SST based method'


%%

figure
subplot(221)
plot(t,sig,'k','linewidth',1.5)
xlim([0 1])
ylim([-1.2 1.2])
xlabel('Time (s)')
ylabel('Amplitude')
subplot(222)
plot(t(2:end),instfrq,'k','linewidth',1.5)
ylim([0 40])
xlabel('Time (s)')
ylabel('Frequency (Hz)')
subplot(223)
plot(1/30:1/30:1,ins_frq,'k','linewidth',1.5)
ylim([0 40])
xlabel('Time (s)')
ylabel('Frequency (Hz)')
subplot(224)
plot(t,fridge,'k','linewidth',1.5)
ylim([0 40])
xlim([0 1])
xlabel('Time (s)')
ylabel('Frequency (Hz)')