clear
close all
clc

load case2

data4 = opvar;


%%
% 707

sig707 = data4(2+3*6:1+4*6,:);

figure
subplot(211)
hold on
plot(data4(1,:),sig707(1,:))
plot(data4(1,:),sig707(2,:))
plot(data4(1,:),sig707(3,:))
xlabel 'Time (s)'
title '707 current'

subplot(212)
hold on
plot(data4(1,:),sig707(4,:))
plot(data4(1,:),sig707(5,:))
plot(data4(1,:),sig707(6,:))
xlabel 'Time (s)'
title '707 voltage'


%%

[aa1 xxx]=  envelope(sig707(1,:)',150,'peak');
[aa2 xxx]=  envelope(sig707(2,:)',150,'peak');
[aa3 xxx]=  envelope(sig707(3,:)',150,'peak');


i1a = smooth(aa1,200);
i1b = smooth(aa2,200);
i1c = smooth(aa3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig707(1:3,:)','linewidth',1.5)
 plot(data4(1,:)',i1a,'linewidth',3)
 plot(data4(1,:)',i1b,'--','linewidth',3)
 plot(data4(1,:)',i1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
ylim([3000 4000])
title '707 Current'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

[bb1 xxx]=  envelope(sig707(4,:)',200,'peak');
[bb2 xxx]=  envelope(sig707(5,:)',200,'peak');
[bb3 xxx]=  envelope(sig707(6,:)',200,'peak');


u1a = smooth(bb1,200);
u1b = smooth(bb2,200);
u1c = smooth(bb3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig707(4:6,:)','linewidth',1.5)
 plot(data4(1,:)',u1a,'linewidth',3)
 plot(data4(1,:)',u1b,'--','linewidth',3)
 plot(data4(1,:)',u1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
%ylim([40 80])
title '707 Voltage'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

bb = 199000;
ff = 210000;

dd1 = abs((i1a(ff)-i1a(bb))/i1a(bb));
dd2 = abs((i1b(ff)-i1b(bb))/i1b(bb));
dd3 = abs((i1c(ff)-i1c(bb))/i1c(bb));

dd4 = abs((u1a(ff)-u1a(bb))/u1a(bb));
dd5 = abs((u1b(ff)-u1b(bb))/u1b(bb));
dd6 = abs((u1c(ff)-u1c(bb))/u1c(bb));

707

(dd1+dd2+dd3+dd4+dd5+dd6)/6
(dd1+dd2+dd3)/3

%%


% 714 

sig714 = data4(2+7*6:1+8*6,:);

figure
subplot(211)
hold on
plot(data4(1,:),sig714(1,:))
plot(data4(1,:),sig714(2,:))
plot(data4(1,:),sig714(3,:))
xlabel 'Time (s)'
title '714 current'

subplot(212)
hold on
plot(data4(1,:),sig714(4,:))
plot(data4(1,:),sig714(5,:))
plot(data4(1,:),sig714(6,:))
xlabel 'Time (s)'
title '714 voltage'


%%

[aa1 xxx]=  envelope(sig714(1,:)',150,'peak');
[aa2 xxx]=  envelope(sig714(2,:)',150,'peak');
[aa3 xxx]=  envelope(sig714(3,:)',150,'peak');


i1a = smooth(aa1,200);
i1b = smooth(aa2,200);
i1c = smooth(aa3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig714(1:3,:)','linewidth',1.5)
 plot(data4(1,:)',i1a,'linewidth',3)
 plot(data4(1,:)',i1b,'--','linewidth',3)
 plot(data4(1,:)',i1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
ylim([3000 4000])
title '714 Current'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

[bb1 xxx]=  envelope(sig714(4,:)',200,'peak');
[bb2 xxx]=  envelope(sig714(5,:)',200,'peak');
[bb3 xxx]=  envelope(sig714(6,:)',200,'peak');


u1a = smooth(bb1,200);
u1b = smooth(bb2,200);
u1c = smooth(bb3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig714(4:6,:)','linewidth',1.5)
 plot(data4(1,:)',u1a,'linewidth',3)
 plot(data4(1,:)',u1b,'--','linewidth',3)
 plot(data4(1,:)',u1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
%ylim([40 80])
title '714 Voltage'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

bb = 199000;
ff = 210000;

dd1 = abs((i1a(ff)-i1a(bb))/i1a(bb));
dd2 = abs((i1b(ff)-i1b(bb))/i1b(bb));
dd3 = abs((i1c(ff)-i1c(bb))/i1c(bb));

dd4 = abs((u1a(ff)-u1a(bb))/u1a(bb));
dd5 = abs((u1b(ff)-u1b(bb))/u1b(bb));
dd6 = abs((u1c(ff)-u1c(bb))/u1c(bb));

714

(dd1+dd2+dd3+dd4+dd5+dd6)/6
(dd1+dd2+dd3)/3

%%

% 725

sig725 = data4(2+8*6:1+9*6,:);

figure
subplot(211)
hold on
plot(data4(1,:),sig725(1,:))
plot(data4(1,:),sig725(2,:))
plot(data4(1,:),sig725(3,:))
xlabel 'Time (s)'
title '725 current'

subplot(212)
hold on
plot(data4(1,:),sig725(4,:))
plot(data4(1,:),sig725(5,:))
plot(data4(1,:),sig725(6,:))
xlabel 'Time (s)'
title '725 voltage'


%%

[aa1 xxx]=  envelope(sig725(1,:)',150,'peak');
[aa2 xxx]=  envelope(sig725(2,:)',150,'peak');
[aa3 xxx]=  envelope(sig725(3,:)',150,'peak');


i1a = smooth(aa1,200);
i1b = smooth(aa2,200);
i1c = smooth(aa3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig725(1:3,:)','linewidth',1.5)
 plot(data4(1,:)',i1a,'linewidth',3)
 plot(data4(1,:)',i1b,'--','linewidth',3)
 plot(data4(1,:)',i1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
ylim([3000 4000])
title '725 Current'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

[bb1 xxx]=  envelope(sig725(4,:)',200,'peak');
[bb2 xxx]=  envelope(sig725(5,:)',200,'peak');
[bb3 xxx]=  envelope(sig725(6,:)',200,'peak');


u1a = smooth(bb1,200);
u1b = smooth(bb2,200);
u1c = smooth(bb3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig725(4:6,:)','linewidth',1.5)
 plot(data4(1,:)',u1a,'linewidth',3)
 plot(data4(1,:)',u1b,'--','linewidth',3)
 plot(data4(1,:)',u1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
%ylim([40 80])
title '725 Voltage'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

bb = 199000;
ff = 210000;

dd1 = abs((i1a(ff)-i1a(bb))/i1a(bb));
dd2 = abs((i1b(ff)-i1b(bb))/i1b(bb));
dd3 = abs((i1c(ff)-i1c(bb))/i1c(bb));

dd4 = abs((u1a(ff)-u1a(bb))/u1a(bb));
dd5 = abs((u1b(ff)-u1b(bb))/u1b(bb));
dd6 = abs((u1c(ff)-u1c(bb))/u1c(bb));

725

(dd1+dd2+dd3+dd4+dd5+dd6)/6
(dd1+dd2+dd3)/3

%%

% 744

sig744 = data4(2+12*6:1+13*6,:);

figure
subplot(211)
hold on
plot(data4(1,:),sig744(1,:))
plot(data4(1,:),sig744(2,:))
plot(data4(1,:),sig744(3,:))
xlabel 'Time (s)'
title '744 current'

subplot(212)
hold on
plot(data4(1,:),sig744(4,:))
plot(data4(1,:),sig744(5,:))
plot(data4(1,:),sig744(6,:))
xlabel 'Time (s)'
title '744 voltage'



%%

[aa1 xxx]=  envelope(sig744(1,:)',150,'peak');
[aa2 xxx]=  envelope(sig744(2,:)',150,'peak');
[aa3 xxx]=  envelope(sig744(3,:)',150,'peak');


i1a = smooth(aa1,200);
i1b = smooth(aa2,200);
i1c = smooth(aa3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig744(1:3,:)','linewidth',1.5)
 plot(data4(1,:)',i1a,'linewidth',3)
 plot(data4(1,:)',i1b,'--','linewidth',3)
 plot(data4(1,:)',i1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
ylim([3000 4000])
title '744 Current'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

[bb1 xxx]=  envelope(sig744(4,:)',200,'peak');
[bb2 xxx]=  envelope(sig744(5,:)',200,'peak');
[bb3 xxx]=  envelope(sig744(6,:)',200,'peak');


u1a = smooth(bb1,200);
u1b = smooth(bb2,200);
u1c = smooth(bb3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig744(4:6,:)','linewidth',1.5)
 plot(data4(1,:)',u1a,'linewidth',3)
 plot(data4(1,:)',u1b,'--','linewidth',3)
 plot(data4(1,:)',u1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
%ylim([40 80])
title '744 Voltage'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

bb = 199000;
ff = 210000;

dd1 = abs((i1a(ff)-i1a(bb))/i1a(bb));
dd2 = abs((i1b(ff)-i1b(bb))/i1b(bb));
dd3 = abs((i1c(ff)-i1c(bb))/i1c(bb));

dd4 = abs((u1a(ff)-u1a(bb))/u1a(bb));
dd5 = abs((u1b(ff)-u1b(bb))/u1b(bb));
dd6 = abs((u1c(ff)-u1c(bb))/u1c(bb));

744
(dd1+dd2+dd3+dd4+dd5+dd6)/6
(dd1+dd2+dd3)/3

%%

% 727

sig727 = data4(2+13*6:1+14*6,:);

figure
subplot(211)
hold on
plot(data4(1,:),sig727(1,:))
plot(data4(1,:),sig727(2,:))
plot(data4(1,:),sig727(3,:))
xlabel 'Time (s)'
title '727 current'

subplot(212)
hold on
plot(data4(1,:),sig727(4,:))
plot(data4(1,:),sig727(5,:))
plot(data4(1,:),sig727(6,:))
xlabel 'Time (s)'
title '727 voltage'


%%

[aa1 xxx]=  envelope(sig727(1,:)',150,'peak');
[aa2 xxx]=  envelope(sig727(2,:)',150,'peak');
[aa3 xxx]=  envelope(sig727(3,:)',150,'peak');


i1a = smooth(aa1,200);
i1b = smooth(aa2,200);
i1c = smooth(aa3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig727(1:3,:)','linewidth',1.5)
 plot(data4(1,:)',i1a,'linewidth',3)
 plot(data4(1,:)',i1b,'--','linewidth',3)
 plot(data4(1,:)',i1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
ylim([3000 4000])
title '727 Current'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

[bb1 xxx]=  envelope(sig727(4,:)',200,'peak');
[bb2 xxx]=  envelope(sig727(5,:)',200,'peak');
[bb3 xxx]=  envelope(sig727(6,:)',200,'peak');


u1a = smooth(bb1,200);
u1b = smooth(bb2,200);
u1c = smooth(bb3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig727(4:6,:)','linewidth',1.5)
 plot(data4(1,:)',u1a,'linewidth',3)
 plot(data4(1,:)',u1b,'--','linewidth',3)
 plot(data4(1,:)',u1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
ylim([40 80])
title '727 Voltage'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

bb = 199000;
ff = 210000;

dd1 = abs((i1a(ff)-i1a(bb))/i1a(bb));
dd2 = abs((i1b(ff)-i1b(bb))/i1b(bb));
dd3 = abs((i1c(ff)-i1c(bb))/i1c(bb));

dd4 = abs((u1a(ff)-u1a(bb))/u1a(bb));
dd5 = abs((u1b(ff)-u1b(bb))/u1b(bb));
dd6 = abs((u1c(ff)-u1c(bb))/u1c(bb));

727
(dd1+dd2+dd3+dd4+dd5+dd6)/6
(dd1+dd2+dd3)/3

%%

% 799

sig799 = data4(2:1+1*6,:);

figure
subplot(211)
hold on
plot(data4(1,:),sig799(1,:))
plot(data4(1,:),sig799(2,:))
plot(data4(1,:),sig799(3,:))
xlabel 'Time (s)'
title '799 current'

subplot(212)
hold on
plot(data4(1,:),sig799(4,:))
plot(data4(1,:),sig799(5,:))
plot(data4(1,:),sig799(6,:))
xlabel 'Time (s)'
title '799 voltage'


%%

[aa1 xxx]=  envelope(sig799(1,:)',150,'peak');
[aa2 xxx]=  envelope(sig799(2,:)',150,'peak');
[aa3 xxx]=  envelope(sig799(3,:)',150,'peak');


i1a = smooth(aa1,200);
i1b = smooth(aa2,200);
i1c = smooth(aa3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig799(1:3,:)','linewidth',1.5)
 plot(data4(1,:)',i1a,'linewidth',3)
 plot(data4(1,:)',i1b,'--','linewidth',3)
 plot(data4(1,:)',i1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
ylim([3000 4000])
title '799 Current'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

[bb1 xxx]=  envelope(sig799(4,:)',200,'peak');
[bb2 xxx]=  envelope(sig799(5,:)',200,'peak');
[bb3 xxx]=  envelope(sig799(6,:)',200,'peak');


u1a = smooth(bb1,200);
u1b = smooth(bb2,200);
u1c = smooth(bb3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig799(4:6,:)','linewidth',1.5)
 plot(data4(1,:)',u1a,'linewidth',3)
 plot(data4(1,:)',u1b,'--','linewidth',3)
 plot(data4(1,:)',u1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
%ylim([40 80])
title '799 Voltage'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

bb = 199000;
ff = 210000;

dd1 = abs((i1a(ff)-i1a(bb))/i1a(bb));
dd2 = abs((i1b(ff)-i1b(bb))/i1b(bb));
dd3 = abs((i1c(ff)-i1c(bb))/i1c(bb));

dd4 = abs((u1a(ff)-u1a(bb))/u1a(bb));
dd5 = abs((u1b(ff)-u1b(bb))/u1b(bb));
dd6 = abs((u1c(ff)-u1c(bb))/u1c(bb));

799
(dd1+dd2+dd3+dd4+dd5+dd6)/6
(dd1+dd2+dd3)/3


%%

% 702

sig702 = data4(2+1*6:1+2*6,:);

figure
subplot(211)
hold on
plot(data4(1,:),sig702(1,:))
plot(data4(1,:),sig702(2,:))
plot(data4(1,:),sig702(3,:))
xlabel 'Time (s)'
title '702 current'

subplot(212)
hold on
plot(data4(1,:),sig702(4,:))
plot(data4(1,:),sig702(5,:))
plot(data4(1,:),sig702(6,:))
xlabel 'Time (s)'
title '702 voltage'


%%

[aa1 xxx]=  envelope(sig702(1,:)',150,'peak');
[aa2 xxx]=  envelope(sig702(2,:)',150,'peak');
[aa3 xxx]=  envelope(sig702(3,:)',150,'peak');


i1a = smooth(aa1,200);
i1b = smooth(aa2,200);
i1c = smooth(aa3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig702(1:3,:)','linewidth',1.5)
 plot(data4(1,:)',i1a,'linewidth',3)
 plot(data4(1,:)',i1b,'--','linewidth',3)
 plot(data4(1,:)',i1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
ylim([3000 4000])
title '702 Current'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

[bb1 xxx]=  envelope(sig702(4,:)',200,'peak');
[bb2 xxx]=  envelope(sig702(5,:)',200,'peak');
[bb3 xxx]=  envelope(sig702(6,:)',200,'peak');


u1a = smooth(bb1,200);
u1b = smooth(bb2,200);
u1c = smooth(bb3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig702(4:6,:)','linewidth',1.5)
 plot(data4(1,:)',u1a,'linewidth',3)
 plot(data4(1,:)',u1b,'--','linewidth',3)
 plot(data4(1,:)',u1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
%ylim([40 80])
title '702 Voltage'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

bb = 199000;
ff = 210000;

dd1 = abs((i1a(ff)-i1a(bb))/i1a(bb));
dd2 = abs((i1b(ff)-i1b(bb))/i1b(bb));
dd3 = abs((i1c(ff)-i1c(bb))/i1c(bb));

dd4 = abs((u1a(ff)-u1a(bb))/u1a(bb));
dd5 = abs((u1b(ff)-u1b(bb))/u1b(bb));
dd6 = abs((u1c(ff)-u1c(bb))/u1c(bb));

702
(dd1+dd2+dd3+dd4+dd5+dd6)/6
(dd1+dd2+dd3)/3


%%

% 705

sig705 = data4(2+2*6:1+3*6,:);

figure
subplot(211)
hold on
plot(data4(1,:),sig705(1,:))
plot(data4(1,:),sig705(2,:))
plot(data4(1,:),sig705(3,:))
xlabel 'Time (s)'
title '705 current'

subplot(212)
hold on
plot(data4(1,:),sig705(4,:))
plot(data4(1,:),sig705(5,:))
plot(data4(1,:),sig705(6,:))
xlabel 'Time (s)'
title '705 voltage'


%%

[aa1 xxx]=  envelope(sig705(1,:)',150,'peak');
[aa2 xxx]=  envelope(sig705(2,:)',150,'peak');
[aa3 xxx]=  envelope(sig705(3,:)',150,'peak');


i1a = smooth(aa1,200);
i1b = smooth(aa2,200);
i1c = smooth(aa3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig705(1:3,:)','linewidth',1.5)
 plot(data4(1,:)',i1a,'linewidth',3)
 plot(data4(1,:)',i1b,'--','linewidth',3)
 plot(data4(1,:)',i1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
ylim([3000 4000])
title '705 Current'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

[bb1 xxx]=  envelope(sig705(4,:)',200,'peak');
[bb2 xxx]=  envelope(sig705(5,:)',200,'peak');
[bb3 xxx]=  envelope(sig705(6,:)',200,'peak');


u1a = smooth(bb1,200);
u1b = smooth(bb2,200);
u1c = smooth(bb3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig705(4:6,:)','linewidth',1.5)
 plot(data4(1,:)',u1a,'linewidth',3)
 plot(data4(1,:)',u1b,'--','linewidth',3)
 plot(data4(1,:)',u1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
%ylim([40 80])
title '705 Voltage'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

bb = 199000;
ff = 210000;

dd1 = abs((i1a(ff)-i1a(bb))/i1a(bb));
dd2 = abs((i1b(ff)-i1b(bb))/i1b(bb));
dd3 = abs((i1c(ff)-i1c(bb))/i1c(bb));

dd4 = abs((u1a(ff)-u1a(bb))/u1a(bb));
dd5 = abs((u1b(ff)-u1b(bb))/u1b(bb));
dd6 = abs((u1c(ff)-u1c(bb))/u1c(bb));

705
(dd1+dd2+dd3+dd4+dd5+dd6)/6
(dd1+dd2+dd3)/3


%%

% 742

sig742 = data4(2+11*6:1+12*6,:);

figure
subplot(211)
hold on
plot(data4(1,:),sig742(1,:))
plot(data4(1,:),sig742(2,:))
plot(data4(1,:),sig742(3,:))
xlabel 'Time (s)'
title '742 current'

subplot(212)
hold on
plot(data4(1,:),sig742(4,:))
plot(data4(1,:),sig742(5,:))
plot(data4(1,:),sig742(6,:))
xlabel 'Time (s)'
title '742 voltage'


%%

[aa1 xxx]=  envelope(sig742(1,:)',150,'peak');
[aa2 xxx]=  envelope(sig742(2,:)',150,'peak');
[aa3 xxx]=  envelope(sig742(3,:)',150,'peak');


i1a = smooth(aa1,200);
i1b = smooth(aa2,200);
i1c = smooth(aa3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig742(1:3,:)','linewidth',1.5)
 plot(data4(1,:)',i1a,'linewidth',3)
 plot(data4(1,:)',i1b,'--','linewidth',3)
 plot(data4(1,:)',i1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
ylim([3000 4000])
title '742 Current'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

[bb1 xxx]=  envelope(sig742(4,:)',200,'peak');
[bb2 xxx]=  envelope(sig742(5,:)',200,'peak');
[bb3 xxx]=  envelope(sig742(6,:)',200,'peak');


u1a = smooth(bb1,200);
u1b = smooth(bb2,200);
u1c = smooth(bb3,200);
 

figure
 
hold on
 plot(data4(1,:)',sig742(4:6,:)','linewidth',1.5)
 plot(data4(1,:)',u1a,'linewidth',3)
 plot(data4(1,:)',u1b,'--','linewidth',3)
 plot(data4(1,:)',u1c,'linewidth',3)
xlabel 'Time (s)'
xlim([9.95 10.05])
%ylim([40 80])
title '742 Voltage'
%legend('Phase A','Phase B','Phase C','UA','UB','UC')
box on

%%

bb = 199000;
ff = 210000;

dd1 = abs((i1a(ff)-i1a(bb))/i1a(bb));
dd2 = abs((i1b(ff)-i1b(bb))/i1b(bb));
dd3 = abs((i1c(ff)-i1c(bb))/i1c(bb));

dd4 = abs((u1a(ff)-u1a(bb))/u1a(bb));
dd5 = abs((u1b(ff)-u1b(bb))/u1b(bb));
dd6 = abs((u1c(ff)-u1c(bb))/u1c(bb));

742
(dd1+dd2+dd3+dd4+dd5+dd6)/6
(dd1+dd2+dd3)/3


