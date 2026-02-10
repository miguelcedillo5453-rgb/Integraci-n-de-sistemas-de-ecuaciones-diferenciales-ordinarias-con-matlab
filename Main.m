clear; clc; close all

Ip  = 0.0079;        
Mc  = 0.7031;        
lp  = 0.3302;        
Mp  = 0.23;          
Fc  = 0;             
Beq = 4.3;           
Bp  = 0.0024;        
g   = 9.81;          

params = [Ip Mc lp Mp Fc Beq Bp g];

a0 = deg2rad(1);   

y0 = [ ...
    0;        
    0;        
    a0;   
    0];       

tspan = [0 10];

[t, y0] = ode45(@(t,y) Pendulo(t,y,params), tspan, y0);

figure
subplot(2,1,1)
plot(t, y0(:,3),'LineWidth',1.5)
grid on
ylabel('\alpha (rad)')
title('Ángulo del péndulo')

subplot(2,1,2)
plot(t, y0(:,1),'LineWidth',1.5)
grid on
ylabel('xc (m)')
xlabel('Tiempo (s)')
title('Posición')