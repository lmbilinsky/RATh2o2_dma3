function [T gsh gssg h2o2 T_7p5 h2o2dma3_7p5 gshdma3_7p5] =RATh2o2_dma3

close all



%MODEL PARAMETERS
%Volumes of compartments
vmed=100e-6; %volume in liters
cellnum=20000;
cellvol=7000e-9; %B10NUMB3R5 website states that the volume of a rat hepatocyte is 7000 cubic micrometers. I have converted this to microL.
vcell=cellnum*cellvol*1e-6; %starting volume of seeded cells, in liters


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
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_0p1=100*Y(length(T),65)/cellnum;
h2o2dma3_0p1=0.85*Y(:,32)+0.15*Y(:,21);
dma3_0p1=Y(:,102);
T_0p1=T;


yinitstartarsenicnonac(100)=1;
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_1p0=100*Y(length(T),65)/cellnum;
h2o2dma3_1p0=0.85*Y(:,32)+0.15*Y(:,21);
dma3_1p0=Y(:,102);
T_1p0=T;


yinitstartarsenicnonac(100)=2.5;
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_2p5=100*Y(length(T),65)/cellnum;
h2o2dma3_2p5=0.85*Y(:,32)+0.15*Y(:,21);
dma3_2p5=Y(:,102);
T_2p5=T;


yinitstartarsenicnonac(100)=5;
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_5p0=100*Y(length(T),65)/cellnum;
h2o2dma3_5p0=0.85*Y(:,32)+0.15*Y(:,21);
dma3_5p0=Y(:,102);
T_5p0=T;


yinitstartarsenicnonac(100)=7.5;
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_7p5=100*Y(length(T),65)/cellnum;
h2o2dma3_7p5=0.85*Y(:,32)+0.15*Y(:,21);
dma3_7p5=Y(:,102);
gshdma3_7p5=0.85*Y(:,5)+0.15*Y(:,3);
T_7p5=T;


yinitstartarsenicnonac(100)=10;
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnonac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
viadma3_10p0=100*Y(length(T),65)/cellnum;
h2o2dma3_10p0=0.85*Y(:,32)+0.15*Y(:,21);
dma3_10p0=Y(:,102);
T_10p0=T;


%DMA3 MODEL: NAC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load yinitialconditionarsenicnac


yinitstartarsenicnac(100)=0.1;
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
nacviadma3_0p1=100*Y(length(T),65)/cellnum;
nach2o2dma3_0p1=0.85*Y(:,32)+0.15*Y(:,21);
nacT_0p1=T;


yinitstartarsenicnac(100)=1;
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
nacviadma3_1p0=100*Y(length(T),65)/cellnum;
nach2o2dma3_1p0=0.85*Y(:,32)+0.15*Y(:,21);
nacT_1p0=T;


yinitstartarsenicnac(100)=2.5;
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
nacviadma3_2p5=100*Y(length(T),65)/cellnum;
nach2o2dma3_2p5=0.85*Y(:,32)+0.15*Y(:,21);
nacT_2p5=T;


yinitstartarsenicnac(100)=5;
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
nacviadma3_5p0=100*Y(length(T),65)/cellnum;
nach2o2dma3_5p0=0.85*Y(:,32)+0.15*Y(:,21);
nacT_5p0=T;


yinitstartarsenicnac(100)=7.5;
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
nacviadma3_7p5=100*Y(length(T),65)/cellnum;
nach2o2dma3_7p5=0.85*Y(:,32)+0.15*Y(:,21);
nacgshdma3_7p5=0.85*Y(:,5)+0.15*Y(:,3);
nacT_7p5=T;


yinitstartarsenicnac(100)=10;
[T,Y] = ode15s(@rath2o2_dma3, [0 24], yinitstartarsenicnac, [], vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);
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





end


%------------------------------------------------------------------------
function dy=rath2o2_dma3(t, y, vmed, vcell, diffh2o2, vh2o2other, vh2o2prod, gsh_deg, NADPH);

cellnum=20000;

PIdma3liver=2.3194e-6;
PIdma5liver=1.8555e-7;
Pdma3liver=100;
Pdma5liver=1;
dma3todma5liver=9.2775e-7;



fracliver=y(65)/cellnum;


death=0.0009;
h2o2=0.85*y(32)+0.15*y(21);


limit=150;

if h2o2 < 1
     deathrate=0;
elseif ((h2o2 >= 1) & (h2o2 < limit))
     deathrate=death*h2o2;
else
     deathrate=death*limit;
end


%if h2o2<limit
%    deathrate=death*h2o2;
%else
%    deathrate=death*limit;
%end





%These are parameters describing excess H2O2 production when intracellular DMA3 is present
a=2.2;
b=0.0005;
km=0.2;
n=2.5;





dy=zeros(107,1);

dy(3)=Vgshcyttomito(y(5))*(0.85/0.15)-Vgshmitotocyt(y(3)) - 2*VGPXmito(y(3), y(21)) + 2*VGRmito(y(30), NADPH); %liver mito GSH

dy(30)= VGPXmito(y(3),y(21)) - VGRmito(y(30), NADPH); % liver mito GSSG 

dy(4)=(vmed/vcell)*Vcysinrat(y(11)) - VGCLholorat(y(4),y(5)) + 100 - Vcysdioxygenase(y(4)); % liver cysteine. Extra 100 is input from MET cycle

dy(5)=VGSSrat(y(6)) - 2*VGPXcyt(y(5), y(32)) + 2*VGRcyt(y(12), NADPH) - vGSHout_h(y(5)) - vGSHout_l(y(5)) - Vgshcyttomito(y(5)) + Vgshmitotocyt(y(3))*(0.15/0.85); %liver cytosolic GSH. 

dy(6)=VGCLholorat(y(4),y(5))/0.85 - VGSSrat(y(6)); %liver gamma-GC. 

dy(8)=(0.85*vcell*fracliver/vmed)*vGSHout_h(y(5)) + (0.85*vcell*fracliver/vmed)*vGSHout_l(y(5)) - gsh_deg*y(8) + 2*(0.85*vcell*fracliver/vmed)*vGSSGout(y(12)); % med gsh

dy(10) = 100*y(11) - 100*(20/250.5)*y(10); %med cystine

dy(11)= gsh_deg*y(8) - fracliver*Vcysinrat(y(11)) - 2*100*y(11) + 2*100*(20/250.5)*y(10); % med cysteine

dy(12)=VGPXcyt(y(5),y(32)) - VGRcyt(y(12), NADPH) - vGSSGout(y(12)); % liver cytosolic GSSG

dy(21)= vh2o2prod - diffh2o2*y(21) - VGPXmito(y(3),y(21)); %H2O2 in liver mitochondria. 

dy(32)= (0.15/0.85)*diffh2o2*y(21) - VGPXcyt(y(5), y(32)) + vh2o2other*(1+(a*y(102)/(y(102)+km)+b*y(102)^n)) - Vcat(y(32)); %H2O2 in liver cytosol



dy(57) = sin(100*t);  %this is just to ensure numerical accuracy

dy(65) = - deathrate*y(65); % living hepatocytes (neglect regeneration)

dy(100)= -PIdma3liver*(y(100)-y(102)/Pdma3liver)/vmed                      ;%DMA3 in medium

dy(101)= -PIdma5liver*(y(101)-y(103)/Pdma5liver)/vmed                ;%DMA5 in medium

dy(102)= (-dma3todma5liver*y(102) + PIdma3liver*(y(100)-y(102)/Pdma3liver))/vcell                  ;%DMA3 in cells

dy(103)= (dma3todma5liver*y(102) + PIdma5liver*(y(101)-y(103)/Pdma5liver))/vcell            ;%DMA5 in cells












end





