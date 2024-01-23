function [T gsh gssg h2o2 T_7p5 h2o2dma3_7p5 gshdma3_7p5] =RATh2o2_dma3

close all



%MODEL PARAMETERS
%Volumes of compartments
vmed=100e-6; %volume in liters
cellnum=20000;
cellvol=7000e-9; %B10NUMB3R5 website states that the volume of a rat hepatocyte is 7000 cubic micrometers. I have converted this to microL.
vcell=cellnum*cellvol*1e-6; %starting volume of seeded cells, in liters
%ratio=vmed/vcell

%Baseline hepatocyte parameters
NADPH = 50;
diffh2o2=2284581;
vh2o2other=3026;
vh2o2prod=28567;

%Baseline medium parameters
gsh_deg=0;




%DMA3 MODEL: NO NAC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load yinitialconditionarsenicnonac



yinitstartarsenicnonac(100)=0.1;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_0p1=100*Y(length(T),65)/cellnum;
h2o2dma3_0p1=0.85*Y(:,32)+0.15*Y(:,21);
dma3_0p1=Y(:,102);
T_0p1=T;


yinitstartarsenicnonac(100)=1;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_1p0=100*Y(length(T),65)/cellnum;
h2o2dma3_1p0=0.85*Y(:,32)+0.15*Y(:,21);
dma3_1p0=Y(:,102);
T_1p0=T;


yinitstartarsenicnonac(100)=2.5;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_2p5=100*Y(length(T),65)/cellnum;
h2o2dma3_2p5=0.85*Y(:,32)+0.15*Y(:,21);
dma3_2p5=Y(:,102);
T_2p5=T;


yinitstartarsenicnonac(100)=5;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_5p0=100*Y(length(T),65)/cellnum;
h2o2dma3_5p0=0.85*Y(:,32)+0.15*Y(:,21);
dma3_5p0=Y(:,102);
T_5p0=T;


yinitstartarsenicnonac(100)=7.5;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_7p5=100*Y(length(T),65)/cellnum;
h2o2dma3_7p5=0.85*Y(:,32)+0.15*Y(:,21);
dma3_7p5=Y(:,102);
gshdma3_7p5=0.85*Y(:,5)+0.15*Y(:,3);
T_7p5=T;


yinitstartarsenicnonac(100)=10;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_10p0=100*Y(length(T),65)/cellnum;
h2o2dma3_10p0=0.85*Y(:,32)+0.15*Y(:,21);
dma3_10p0=Y(:,102);
T_10p0=T;


%DMA3 MODEL: NAC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load yinitialconditionarsenicnac


yinitstartarsenicnac(100)=0.1;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
nacviadma3_0p1=100*Y(length(T),65)/cellnum;
nach2o2dma3_0p1=0.85*Y(:,32)+0.15*Y(:,21);
nacT_0p1=T;


yinitstartarsenicnac(100)=1;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
nacviadma3_1p0=100*Y(length(T),65)/cellnum;
nach2o2dma3_1p0=0.85*Y(:,32)+0.15*Y(:,21);
nacT_1p0=T;


yinitstartarsenicnac(100)=2.5;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
nacviadma3_2p5=100*Y(length(T),65)/cellnum;
nach2o2dma3_2p5=0.85*Y(:,32)+0.15*Y(:,21);
nacT_2p5=T;


yinitstartarsenicnac(100)=5;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
nacviadma3_5p0=100*Y(length(T),65)/cellnum;
nach2o2dma3_5p0=0.85*Y(:,32)+0.15*Y(:,21);
nacT_5p0=T;


yinitstartarsenicnac(100)=7.5;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
nacviadma3_7p5=100*Y(length(T),65)/cellnum;
nach2o2dma3_7p5=0.85*Y(:,32)+0.15*Y(:,21);
nacgshdma3_7p5=0.85*Y(:,5)+0.15*Y(:,3);
nacT_7p5=T;


yinitstartarsenicnac(100)=10;
[T,Y] = ode15s(@rat, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
nacviadma3_10p0=100*Y(length(T),65)/cellnum;
nach2o2dma3_10p0=0.85*Y(:,32)+0.15*Y(:,21);
nacT_10p0=T;



%DMA3 DATA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dma3data=[0.1 1 2.5 5 7.5 10];

viadma3_no_nacdata=[104 79.6 53.0 35.3 27.8 4.85];
viadma3_no_nacUBdata=[104 90.9 58.9 45.3 34.3 4.85];
viadma3_no_nacUERRORdata=viadma3_no_nacUBdata-viadma3_no_nacdata;

viadma3_nacdata=[99.6 98.3 89.9 85.1 90.2 72.1];
viadma3_nacUBdata=[99.6 104 99.6 88.9 96.4 80.5];
viadma3_nacUERRORdata=viadma3_nacUBdata-viadma3_nacdata;


%DMA3 PLOTS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
errorbar(dma3data, viadma3_no_nacdata, [], viadma3_no_nacUERRORdata , 'ko', 'MarkerFaceColor','k','MarkerSize',8)
hold on
errorbar(dma3data, viadma3_nacdata, [], viadma3_nacUERRORdata , 'ro','MarkerFaceColor','r','MarkerSize',8)
hold on
plot(dma3data,[viadma3_0p1 viadma3_1p0 viadma3_2p5 viadma3_5p0 viadma3_7p5 viadma3_10p0], 'kd', 'MarkerSize',8)
hold on
plot(dma3data,[nacviadma3_0p1 nacviadma3_1p0 nacviadma3_2p5 nacviadma3_5p0 nacviadma3_7p5 nacviadma3_10p0], 'rd', 'MarkerSize',8)
title('DMA^{III} exposure and cell viability')
axis([0.1, 15, 0, 120])
set(gca,'XTick',[0.1 1 10])
set(gca,'YTick',[0 20 40 60 80 100 120]) 
ylabel('Cell viability (% of control)')
xlabel('DMA^{III} concentration (\muM)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%MMA3 MODEL: NO NAC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load yinitialconditionarsenic
%yinitarsenic(106)=0.1;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%viamma3_0p1=100*Y(length(T),65)/cellnum;
%h2o2mma3_0p1=Y(:,32);
%mma3_0p1=Y(:,104);
%T_0p1=T;


%load yinitialconditionarsenic
%yinitarsenic(106)=1;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%viamma3_1p0=100*Y(length(T),65)/cellnum;
%h2o2mma3_1p0=Y(:,32);
%mma3_1p0=Y(:,104);
%T_1p0=T;


%load yinitialconditionarsenic
%yinitarsenic(106)=2.5;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%viamma3_2p5=100*Y(length(T),65)/cellnum;
%h2o2mma3_2p5=Y(:,32);
%mma3_2p5=Y(:,104);
%T_2p5=T;


%load yinitialconditionarsenic
%yinitarsenic(106)=5;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%viamma3_5p0=100*Y(length(T),65)/cellnum;
%h2o2mma3_5p0=Y(:,32);
%mma3_5p0=Y(:,104);
%T_5p0=T;


%load yinitialconditionarsenic
%yinitarsenic(106)=7.5;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%viamma3_7p5=100*Y(length(T),65)/cellnum;
%h2o2mma3_7p5=Y(:,32);
%mma3_7p5=Y(:,104);
%T_7p5=T;


%load yinitialconditionarsenic
%yinitarsenic(106)=10;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%viamma3_10p0=100*Y(length(T),65)/cellnum;
%h2o2mma3_10p0=Y(:,32);
%mma3_10p0=Y(:,104);
%T_10p0=T;


%MMA3 MODEL: NAC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load yinitialconditionarsenic
%yinitarsenic(106)=0.1;
%yinitarsenic(11)=2000;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%nacviamma3_0p1=100*Y(length(T),65)/cellnum;
%nach2o2mma3_0p1=Y(:,32);
%nacT_0p1=T;

%load yinitialconditionarsenic
%yinitarsenic(106)=1;
%yinitarsenic(11)=2000;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%nacviamma3_1p0=100*Y(length(T),65)/cellnum;
%nach2o2mma3_1p0=Y(:,32);
%nacT_1p0=T;

%load yinitialconditionarsenic
%yinitarsenic(106)=2.5;
%yinitarsenic(11)=2000;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%nacviamma3_2p5=100*Y(length(T),65)/cellnum;
%nach2o2mma3_2p5=Y(:,32);
%nacT_2p5=T;

%load yinitialconditionarsenic
%yinitarsenic(106)=5;
%yinitarsenic(11)=2000;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%nacviamma3_5p0=100*Y(length(T),65)/cellnum;
%nach2o2mma3_5p0=Y(:,32);
%nacT_5p0=T;

%load yinitialconditionarsenic
%yinitarsenic(106)=7.5;
%yinitarsenic(11)=2000;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%nacviamma3_7p5=100*Y(length(T),65)/cellnum;
%nach2o2mma3_7p5=Y(:,32);
%nacT_7p5=T;

%load yinitialconditionarsenic
%yinitarsenic(106)=10;
%yinitarsenic(11)=2000;
%[T,Y] = ode15s(@rat, [0 24], yinitarsenic, [], vmed, vcell, cellnum, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%nacviamma3_10p0=100*Y(length(T),65)/cellnum;
%nach2o2mma3_10p0=Y(:,32);
%nacT_10p0=T;


%PLOTS FOR FITTING: MMA3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure
%subplot(6,3,1)
%plot(T_0p1,mma3_0p1)
%xlim([0 24])
%title('MMA3 inside cells: 0.1')
%subplot(6,3,2)
%plot(T_0p1,h2o2mma3_0p1)
%xlim([0 24])
%title('H2O2 in cytosol')
%subplot(6,3,3)
%plot(nacT_0p1,nach2o2mma3_0p1)
%xlim([0 24])
%title('H2O2 in cytosol: NAC')

%subplot(6,3,4)
%plot(T_1p0,mma3_1p0)
%xlim([0 24])
%title('MMA3 inside cells: 1')
%subplot(6,3,5)
%plot(T_1p0,h2o2mma3_1p0)
%xlim([0 24])
%title('H2O2 in cytosol')
%subplot(6,3,6)
%plot(nacT_1p0,nach2o2mma3_1p0)
%xlim([0 24])
%title('H2O2 in cytosol: NAC')



%subplot(6,3,7)
%plot(T_2p5,mma3_2p5)
%xlim([0 24])
%title('MMA3 inside cells: 2.5')
%subplot(6,3,8)
%plot(T_2p5,h2o2mma3_2p5)
%xlim([0 24])
%title('H2O2 in cytosol')
%subplot(6,3,9)
%plot(nacT_2p5,nach2o2mma3_2p5)
%xlim([0 24])
%title('H2O2 in cytosol: NAC')


%subplot(6,3,10)
%plot(T_5p0,mma3_5p0)
%xlim([0 24])
%title('MMA3 inside cells: 5')
%subplot(6,3,11)
%plot(T_5p0,h2o2mma3_5p0)
%xlim([0 24])
%title('H2O2 in cytosol')
%subplot(6,3,12)
%plot(nacT_5p0,nach2o2mma3_5p0)
%xlim([0 24])
%title('H2O2 in cytosol: NAC')


%subplot(6,3,13)
%plot(T_7p5,mma3_7p5)
%xlim([0 24])
%title('MMA3 inside cells: 7.5')
%subplot(6,3,14)
%plot(T_7p5,h2o2mma3_7p5)
%xlim([0 24])
%title('H2O2 in cytosol')
%subplot(6,3,15)
%plot(nacT_7p5,nach2o2mma3_7p5)
%xlim([0 24])
%title('H2O2 in cytosol: NAC')



%subplot(6,3,16)
%plot(T_10p0,mma3_10p0)
%xlim([0 24])
%title('MMA3 inside cells: 10')
%subplot(6,3,17)
%plot(T_10p0,h2o2mma3_10p0)
%xlim([0 24])
%title('H2O2 in cytosol')
%subplot(6,3,18)
%plot(nacT_10p0,nach2o2mma3_10p0)
%xlim([0 24])
%title('H2O2 in cytosol: NAC')




%MMA3 DATA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mma3data=[0.1 1 2.5 5 7.5 10];

%viamma3_no_nacdata=[108 55.8 29.9 8.92 1.53 1.55];
%viamma3_no_nacUBdata=[108 64.2 37.9 12.6 4.31 1.55];
%viamma3_no_nacUERRORdata=viamma3_no_nacUBdata-viamma3_no_nacdata;

%viamma3_nacdata=[110 89.8 95.2 85 86.3 80.4];
%viamma3_nacUBdata=[110 96.7 105 95.5 101 88.5];
%viamma3_nacUERRORdata=viamma3_nacUBdata-viamma3_nacdata;



%MMA3 PLOTS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure
%errorbar(mma3data, viamma3_no_nacdata, [], viamma3_no_nacUERRORdata , 'ko', 'MarkerFaceColor','k','MarkerSize',8)
%hold on
%errorbar(mma3data, viamma3_nacdata, [], viamma3_nacUERRORdata , 'ro','MarkerFaceColor','r','MarkerSize',8)
%hold on
%plot(mma3data,[viamma3_0p1 viamma3_1p0 viamma3_2p5 viamma3_5p0 viamma3_7p5 viamma3_10p0], 'kd', 'MarkerSize',8)
%hold on
%plot(mma3data,[nacviamma3_0p1 nacviamma3_1p0 nacviamma3_2p5 nacviamma3_5p0 nacviamma3_7p5 nacviamma3_10p0], 'rd', 'MarkerSize',8)
%title('MMA^{III} exposure and cell viability')
%axis([0.1, 15, 0, 120])
%set(gca,'XTick',[0.1 1 10])
%set(gca,'YTick',[0 20 40 60 80 100 120]) 
%ylabel('Cell viability (% of control)')
%xlabel('MMA^{III} concentration (\muM)')



%iAs3 DATA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%As3data=[0.1 1 5 10 25 50 75];

%viaAs3_no_nacdata=[108 102 92.5 64.9 44.8 8.67 2.8]; 
%viaAs3_no_nacUBdata=[108 102 98.6 70.7 50.1 12.3 8.35];
%viaAs3_no_nacUERRORdata=viaAs3_no_nacUBdata-viaAs3_no_nacdata;

%viaAs3_nacdata=[100 116 103 85.5 57.6 33.1 17.8];
%viaAs3_nacUBdata=[100 116 111 89.1 62.9 36.4 17.8];
%viaAs3_nacUERRORdata=viaAs3_nacUBdata-viaAs3_nacdata;

%figure
%errorbar(As3data, viaAs3_no_nacdata, [], viaAs3_no_nacUERRORdata , 'ko', 'MarkerFaceColor','k','MarkerSize',8)
%hold on
%errorbar(As3data, viaAs3_nacdata, [], viaAs3_nacUERRORdata , 'ro','MarkerFaceColor','r','MarkerSize',8)
%axis([0.1, 100, 0, 120])
%set(gca,'XTick',[0.1 1 10 100])
%set(gca,'YTick',[0 20 40 60 80 100 120]) 
%ylabel('Cell viability (% of control)')
%xlabel('iAs^{III} concentration (\muM)')
%title('iAs^{III} exposure and cell viability')


%load yinitialconditionculturenac 
%[T,Y] = ode15s(@rat, [0 24], yinitstartculturenac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%yinitstartarsenicnac=Y(length(T),:);
%save('yinitialconditionarsenicnac','yinitstartarsenicnac')



%PLOTS FOR FITTING: DMA3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure
subplot(2,1,1)
plot(T_7p5,gshdma3_7p5)
xlim([0 24])
title('GSH: no NAC')
subplot(2,1,2)
plot(T_7p5,h2o2dma3_7p5)
xlim([0 24])
title('H2O2: no NAC')

figure
subplot(2,1,1)
plot(nacT_7p5,nacgshdma3_7p5)
xlim([0 24])
title('GSH: NAC')
subplot(2,1,2)
plot(nacT_7p5,nach2o2dma3_7p5)
xlim([0 24])
title('H2O2: NAC')

figure
subplot(6,3,1)
plot(T_0p1,dma3_0p1)
xlim([0 24])

title('DMA3 inside cells: 0.1')
subplot(6,3,2)
plot(T_0p1,h2o2dma3_0p1)
xlim([0 24])
title('H2O2')
subplot(6,3,3)
plot(nacT_0p1,nach2o2dma3_0p1)
xlim([0 24])
title('H2O2: NAC')

subplot(6,3,4)
plot(T_1p0,dma3_1p0)
xlim([0 24])
title('DMA3 inside cells: 1')
subplot(6,3,5)
plot(T_1p0,h2o2dma3_1p0)
xlim([0 24])
title('H2O2')
subplot(6,3,6)
plot(nacT_1p0,nach2o2dma3_1p0)
xlim([0 24])
title('H2O2: NAC')



subplot(6,3,7)
plot(T_2p5,dma3_2p5)
xlim([0 24])
title('DMA3 inside cells: 2.5')
subplot(6,3,8)
plot(T_2p5,h2o2dma3_2p5)
xlim([0 24])
title('H2O2')
subplot(6,3,9)
plot(nacT_2p5,nach2o2dma3_2p5)
xlim([0 24])
title('H2O2: NAC')


subplot(6,3,10)
plot(T_5p0,dma3_5p0)
xlim([0 24])
title('DMA3 inside cells: 5')
subplot(6,3,11)
plot(T_5p0,h2o2dma3_5p0)
xlim([0 24])
title('H2O2')
subplot(6,3,12)
plot(nacT_5p0,nach2o2dma3_5p0)
xlim([0 24])
title('H2O2: NAC')


subplot(6,3,13)
plot(T_7p5,dma3_7p5)
xlim([0 24])
title('DMA3 inside cells: 7.5')
subplot(6,3,14)
plot(T_7p5,h2o2dma3_7p5)
xlim([0 24])
title('H2O2')
subplot(6,3,15)
plot(nacT_7p5,nach2o2dma3_7p5)
xlim([0 24])
title('H2O2: NAC')



subplot(6,3,16)
plot(T_10p0,dma3_10p0)
xlim([0 24])
title('DMA3 inside cells: 10')
subplot(6,3,17)
plot(T_10p0,h2o2dma3_10p0)
xlim([0 24])
title('H2O2')
subplot(6,3,18)
plot(nacT_10p0,nach2o2dma3_10p0)
xlim([0 24])
title('H2O2: NAC')

figure
subplot(3,1,1)
plot(T_7p5,dma3_7p5)
xlim([0 24])
title('Intracellular DMA^{III} concentration (concentration of DMA^{III} in medium is 7.5 \mu M)')   
xlabel('Hours')
ylabel('DMA^{III} (\mu M)')

subplot(3,1,2)
plot(T_7p5,h2o2dma3_7p5)
xlim([0 24])
xlabel('Hours')
ylabel('H_2O_2 (\mu M)')

subplot(3,1,3)
plot(nacT_7p5,nach2o2dma3_7p5)
xlim([0 24])
xlabel('Hours')
ylabel('H_2O_2 (\mu M)')




load yinitialcondition
%yinit(4)=1500;
[T,Y] = ode15s(@rat, [0 16], yinit, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
%yinit=Y(length(T),:);
%save('yinitialcondition','yinit')




gsh=0.85*Y(:,5)+0.15*Y(:,3);
gssg=0.85*Y(:,12)+0.15*Y(:,30);
h2o2=0.85*Y(:,32)+0.15*Y(:,21);



%figure  %"Rat liver cytosolic GSH turns over rapidly with a half-life of 2-3 hours" (Lu13--Glutathione synthesis, from BBA)
%plot(T,Y(:,5))
%title('cytosolic GSH')


figure
subplot(4,1,1)
plot(T,gsh*100/9435)
xlim([8 16])
title('GSH in hepatocytes after blocking GSH synthesis')   
xlabel('Hours')
ylabel('GSH (% normal)')

subplot(4,1,2)
plot(T,gsh./gssg)
xlim([8 16])
ylabel('GSH:GSSG ratio')
xlabel('Hours')


subplot(4,1,3)
plot(T,h2o2)
xlim([8 16])
title('Intracellular H_{2}O_{2} after blocking GSH synthesis')
xlabel('Hours')
ylabel('H_{2}O_{2} (\mu M)')

subplot(4,1,4)
plot(T,Y(:,65)*100/cellnum)
xlim([8 16])
%xlabel('Hours')
ylabel('% hepatocyte survival')



format long
%AA INPUTS INTO BLOOD
cysinput=cysinarsenic(T(length(T)));


%CONCENTRATIONS
cystine_med=Y(length(T),10);
cys_med = Y(length(T),11);
gsh_med = Y(length(T),8);

cys_mz  = Y(length(T),4);
glutamylcys_mz = Y(length(T),6);
gsh_cyt_mz  = Y(length(T),5);
gsh_mito_mz=Y(length(T),3);
gssg_cyt_mz = Y(length(T),12);
gssg_mito_mz=Y(length(T),30);
h2o2_cyt_mz=Y(length(T),32);
h2o2_mito_mz=Y(length(T),21);


%VELOCITIES
vmedCYSl=Vcysinarsenic(cys_med);
vmedGSHdeg=gsh_deg*gsh_med;

vcysdioxy_mz=VCYSDIOXYGENASEmousequadratic(cys_mz);
vgcl_mz=  VGCLholorat(cys_mz,gsh_cyt_mz);
vgss_mz = VGSSrat(glutamylcys_mz);
vgshcyt_to_mito_mz=Vgshcyttomito(gsh_cyt_mz);
vgshmito_to_cyt_mz=Vgshmitotocyt(gsh_mito_mz);
vdiffh2o2mito_to_cyt_mz=diffh2o2*h2o2_mito_mz;
vmzGSHb=vGSHout_l(gsh_cyt_mz) + vGSHout_h(gsh_cyt_mz); 
vgpx_mzcyt=VGPXcyt(gsh_cyt_mz,h2o2_cyt_mz);
vgr_mzcyt=VGRcyt(gssg_cyt_mz,NADPH);
vgpx_mzmito=VGPXmito(gsh_mito_mz,h2o2_mito_mz);
vgr_mzmito=VGRmito(gssg_mito_mz,NADPH);
vmzGSSGbile= vGSSGout(gssg_cyt_mz);


M=zeros(116,1);
M(4)=cys_mz;
M(5) = gsh_cyt_mz;
M(6) = glutamylcys_mz;
M(8) = gsh_med;
M(10)=cystine_med;
M(11)=cys_med;
M(12)=gssg_cyt_mz;
M(17)=vcysdioxy_mz;
M(19)=vgcl_mz;
M(20)=vgss_mz;
M(27)=vmedCYSl;
M(28)=vmzGSHb;
M(29)=vmzGSSGbile;
M(30)=vgpx_mzcyt;
M(31)=vgr_mzcyt;
M(33)=vmedGSHdeg;
M(51)=vgshcyt_to_mito_mz;
M(53)=vgpx_mzmito;
M(54)=vgr_mzmito;
M(55)=vgshmito_to_cyt_mz;
M(57)=gsh_mito_mz;
M(58)=gssg_mito_mz;
M(89)=vh2o2prod;
M(91)=h2o2_mito_mz;
M(98)=vdiffh2o2mito_to_cyt_mz;
M(99)=h2o2_cyt_mz;
M(103)=vh2o2other;



PrintFinalValuesArsenic(vcell, vmed, M, cysinput);






end


%------------------------------------------------------------------------
function dy=rat(t, y, vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);

cellnum=20000;

PIdma3liver=2.3194e-6;
PIdma5liver=1.8555e-7;
Pdma3liver=100;
Pdma5liver=1;
dma3todma5liver=9.2775e-7;



fracliver=y(65)/cellnum;





% death=0.0008;
% a=2.5;
% b=0.0014;
% km=0.5;
% n=2;
% 

death=10*0.0009;
h2o2=0.85*y(32)+0.15*y(21);


limit=150;
if h2o2<limit
    deathrate=death*h2o2;
else
    deathrate=death*limit;
end


a=2.2;
b=0.0005;
km=0.2;
n=2.5;





dy=zeros(107,1);

dy(3)=Vgshcyttomito(y(5))*(0.85/0.15)-Vgshmitotocyt(y(3)) - 2*VGPXmito(y(3), y(21)) + 2*VGRmito(y(30), NADPH); %liver mito GSH

dy(30)= VGPXmito(y(3),y(21)) - VGRmito(y(30), NADPH); % liver mito GSSG 

dy(4)=(vmed/vcell)*Vcysinarsenic(y(11)) - VGCLholorat(y(4),y(5)) + 100 - VCYSDIOXYGENASEmousequadratic(y(4)); % liver cysteine. Extra 100 is input from MET cycle

dy(5)=VGSSrat(y(6)) - 2*VGPXcyt(y(5), y(32)) + 2*VGRcyt(y(12), NADPH) - vGSHout_h(y(5)) - vGSHout_l(y(5)) - Vgshcyttomito(y(5)) + Vgshmitotocyt(y(3))*(0.15/0.85); %liver cytosolic GSH. 

dy(6)=VGCLholorat(y(4),y(5))/0.85 - VGSSrat(y(6)); %liver gamma-GC. 

dy(8)=(0.85*vcell*fracliver/vmed)*vGSHout_h(y(5)) + (0.85*vcell*fracliver/vmed)*vGSHout_l(y(5)) - gsh_deg*y(8) + 2*(0.85*vcell*fracliver/vmed)*vGSSGout(y(12)); % med gsh

dy(10) = 100*y(11) - 100*(20/250.5)*y(10); %med cystine

dy(11)= cysinarsenic(t) + gsh_deg*y(8) - fracliver*Vcysinarsenic(y(11)) - 2*100*y(11) + 2*100*(20/250.5)*y(10); % med cysteine

dy(12)=VGPXcyt(y(5),y(32)) - VGRcyt(y(12), NADPH) - vGSSGout(y(12)); % liver cytosolic GSSG

dy(21)= vh2o2prod - diffh2o2*y(21) - VGPXmito(y(3),y(21)); %H2O2 in liver mitochondria. 

dy(32)= (0.15/0.85)*diffh2o2*y(21) - VGPXcyt(y(5), y(32)) + vh2o2other*(1+(a*y(102)/(y(102)+km)+b*y(102)^n)) - Vcat(y(32)); %H2O2 in liver cytosol

%vh2o2other*(1+0.0175*(a*y(102)/(y(102)+km)+b*y(102)^n))


dy(57) = sin(100*t);

dy(65) = - deathrate*y(65); % living hepatocytes (neglect regeneration)

dy(100)= -PIdma3liver*(y(100)-y(102)/Pdma3liver)/vmed                      ;%DMA3 in medium

dy(101)= -PIdma5liver*(y(101)-y(103)/Pdma5liver)/vmed                ;%DMA5 in medium

dy(102)= (-dma3todma5liver*y(102) + PIdma3liver*(y(100)-y(102)/Pdma3liver))/vcell                  ;%DMA3 in cells

dy(103)= (dma3todma5liver*y(102) + PIdma5liver*(y(101)-y(103)/Pdma5liver))/vcell            ;%DMA5 in cells









%dy(101)=p1*vcell*y(103)-(1e-6)*T_max*(y(101)/(K_t+y(101))); %iAs in medium

%dy(102)=k1*y(103)*vcell-k2*y(102)*vcell; %protein-bound iAs inside liver

%dy(103)=(1e-6)*T_max*(y(101)/(K_t+y(101)))+k2*y(102)*vcell-k1*y(103)*vcell-k3*y(103)*vcell-p1*y(103)*vcell; %free iAs inside liver

%dy(104)=k3*y(103)*vcell-p2*y(104)*vcell-(1e-6)*V_max*y(104)/(K_m + y(104)*(1+y(103)/K_i))+p2*vmed*y(106); %MMA inside liver

%dy(105)=(1e-6)*V_max*y(104)/(K_m + y(104)*(1+y(103)/K_i))-p3*y(105)*vcell; %DMA inside liver

%dy(106)=p2*vcell*y(104)-p2*y(106)*vmed; %MMA in medium

%dy(107)=p3*vcell*y(105); %DMA in medium


end





