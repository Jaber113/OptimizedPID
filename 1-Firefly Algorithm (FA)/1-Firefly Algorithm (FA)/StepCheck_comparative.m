clc
clear all
close all
s=tf('s');

%Dynamic Modeling and Control of a sepic Converter
%interleaved
%plant=((-0.0001281*s^3)-(3.318*10^-7*s^2)+(1.934*10^-10*s)+(1.117*10^-14))/((s^4)+(0.002214*s^3)+(3.955*10^-7*s^2)+(2.269*10^-10*s)+(1.123*10^-14));
%CSEPIC
%plant=((0.001369*s^3)+(1.182*10^-5*s^2)+(3.972*10^-8*s)+(3.018*10^-11))/((s^4)+(0.007753*s^3)+(2.201*10^-5*s^2)+(4.588*10^-8*s)+(3.14*10^-11));

%num = [0.07883 15.39 47.93 -0.1056 0.004048 6.155e-07];
%den = [1.079  15.51 47.93 -0.1056 0.004048 6.155e-07];
%g=tf(num,den)

%BSEPIC
%plant =((0.03706*s^3)-(8.257*10^-5*s^2)+(3.128*10^-6*s)+(4.756*10^-10))/((s^4)+(0.1188*s^3)+(0.0002963*s^2)+(3.286*10^-06*s)+(4.919*10^-10))

%isepic
plant=(-(0.001328*s^3)+(1.21*10^-5*s^2)+(2.438*10^-09*s)+(9.775*10^-14))/((s^4)+(0.003659*s^3)+(7.64*10^-6*s^2)+(1.374*10^-9*s)+(1.013*10^-13));

%% Conventional PID parameters 
%CSEPIC
%kp=415.212
%ki=1294.1967
%kd= 2.127

%kp=415.212;
%ki=1294.1967;
%kd= 2.127;

kp=-7357.6859;
ki=-11950.1831;
kd= -61.2834;

cont=kp+(ki/s)+(kd*s);
z=(cont*plant);
Conventional=feedback(z,1)

%% IAE
%CSEPIC
%kp0= 3276.1
%ki0= 362.5098
%kd0=  37.5453

%BSEPIC
kp0=  827.5014
ki0=  209.9814
kd0=  2.9901
cont0=kp0+(ki0/s)+(kd0*s);
z0=cont0*plant;
IAE=feedback(z0,1)

%% ITAE
%CSEPIC
%kp1= 3656.5
%ki1=  1468.3
%kd1=  48.5017

%BSEPIC
kp1= 834.5021
ki1= 1444.5
kd1= 1.5396;

cont1=kp1+(ki1/s)+(kd1*s);
z1=cont1*plant;
ITAE=feedback(z1,1)


%% ISE
%CSEPIC
%kp2= 3546.8
%ki2=  388.7232
%kd2=  53.2183

%BSEPIC
kp2= -8976.3
ki2= -8118.9
kd2=  -77.6868
cont2=kp2+(ki2/s)+(kd2*s);
z2=cont2*plant;
FA_ISE=feedback(z2,1)


kp4= -8974.3
ki4= -8472.3
kd4=  -85.1738
cont4=kp4+(ki4/s)+(kd4*s);
z4=cont4*plant;
ACOR_ISE=feedback(z4,1)

%% ITSE
%CSEPIC
%kp3= 3495.1
%ki3= 354.2103
%kd3= 81.5848


%BSEPIC
kp3= -8898.1
ki3= -7556.3
kd3= -43.3105

cont3=kp3+(ki3/s)+(kd3*s);
z3=cont3*plant;
PSO_ITSE=feedback(z3,1)



%xlim([0 10])
figure
step(plant)
%figure
%step(Conventional)
%figure
%step(Conventional)
%figure
%step(IAE)
figure
%step(ISE)
figure
%step(ITSE)
figure
%step(ITAE)


%g= stepinfo(plant)
%[y,t]=step(ITAE)
%sserror=abs(1-y(end))
figure
step(FA_ISE,PSO_ITSE,ACOR_ISE)

stepinfo(Conventional)
stepinfo(IAE)
stepinfo(ISE)
stepinfo(ITAE)
stepinfo(ITSE)
stepinfo(plant)
%stepinfo(Conventional,IAE,ISE,ITSE,ITAE)


%step(ITAE)
%figure
%bode(plant)

%margin(plant)

%bode(Conventional)

%margin(Conventional)
%[GM PM Wpc Wqc]=margin(plant)
%figure
%pzmap(plant)
%figure
%pzmap(Conventional)
%figure
%pzmap(IAE)
%figure
%pzmap(ISE)
%figure
%pzmap(ITSE)
%figure
%pzmap(ITAE)
%figure
%rlocus(ISE)
%figure
%sgrid(0.75687,4.3478)
%[Kp, poles]=rlocfind(ISE)
%b=[0.1356 5.477 0.9903 0.008301 2.748e-05 2.079e-08]
%a=[1.136 5.485 0.9903 0.008301 2.748e-05 2.079e-08]
%[h,w]=freqz(a,b)
%figure
%subplot(2,1,1); 
%plot(w/pi,abs(h)); 
%subplot(2,1,2);
%plot(w/pi,angle(h)); 
%filename = 'BSEPIC.xlsx';
%xlswrite(filename,kp0,1,'A3');
%figure
%[z,p]=tf2zp(num,den)
%eig(plant)








