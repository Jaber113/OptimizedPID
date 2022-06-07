function [ o ] =FA_ObjectiveFunction( x )
s=tf('s');

%% Transfer Function
%csepic
plant=((0.001369*s^3)+(1.182*10^-5*s^2)+(3.972*10^-8*s)+(3.018*10^-11))/((s^4)+(0.007753*s^3)+(2.201*10^-5*s^2)+(4.588*10^-8*s)+(3.14*10^-11));
%bsepic
%plant=((0.03706*s^3)-(8.257*10^-5*s^2)+(3.128*10^-6*s)+(4.756*10^-10))/((s^4)+(0.1188*s^3)+(0.0002963*s^2)+(3.286*10^-06*s)+(4.919*10^-10));

%% PID Controller
kp=x(1);
ki=x(2);
kd=x(3);
    
cont=kp+(ki/s)+(kd*s);

%step=(feedback(plant*cont,1))
dt=0.01;
t=0:dt:10;
e=1-step(feedback(cont*plant,1),t);

%% Fitness Functions
%j=sum(abs(e)*dt); %IAE
%j=sum(t'.*abs(e)*dt); %ITAE
%j=sum((abs(e).*abs(e))*dt); %ISE
j=sum(t'.*(abs(e).*abs(e))*dt); %ITSE
o=j;
end