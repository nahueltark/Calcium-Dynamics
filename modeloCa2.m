function dx = modeloCa(t,x,v,gamma,k,dcell,dvac)
% Definiciones
k_vcx1= k(1); %[uM] Cui
k_pmc1= k(2); %[uM] Cui/Pittman
k_pmr1= k(3); %[uM] Cui
% k_vcx1= 25; %[uM] Pittma

ca_0_cit=0.200; %[uM] *Halamich 1989
ca_0_vac=2000; %[uM] *Dunn 1994 o 1300000NnM en Halamich 1989

alpha_vcx1=v(1);
alpha_pmc1=v(2);
alpha_pmr1=v(3);

k1=alpha_pmc1*ca_0_cit/(ca_0_cit + k_pmc1);
k2=alpha_pmr1*ca_0_cit/(ca_0_cit + k_pmr1);
k3=alpha_vcx1*ca_0_cit/(ca_0_cit + k_vcx1);
diametro_cell=dcell;%[um]
diametro_vac =dvac;%[um]

% x es un vectro de estados
cac=x(1);
cav=x(2);

%Ecuaciones
dcac=-alpha_pmc1*cac/(cac + k_pmc1) + k1 -alpha_pmr1*cac/(cac + k_pmr1) + k2 -alpha_vcx1*cac/(cac + k_vcx1) + k3;
alpha_pmr1=0; %x estoy en la vacuola
k2=0;
% dcav=((diametro_cell^3-diametro_vac^3)/diametro_vac^3)*(alpha_pmc1*cac/(cac + k_pmc1) - k1 + alpha_pmr1*cac/(cac + k_pmr1) - k2 +alpha_vcx1*cac/(cac + k_vcx1) - k3 -gamma*(cav-ca_0_vac));
dcav=(((diametro_cell^3)*0.5+((4+0.0005*t)*(diametro_cell^2))*0.5-(diametro_vac^3))/diametro_vac^3)*(alpha_pmc1*cac/(cac + k_pmc1) - k1 + alpha_pmr1*cac/(cac + k_pmr1) - k2 +alpha_vcx1*cac/(cac + k_vcx1) - k3 -gamma*(cav-ca_0_vac));
%Salida
dx=[dcac; dcav];
end