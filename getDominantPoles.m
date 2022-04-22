OS=16.3
zeta=-log(OS/100)/sqrt(pi^2+[log(OS/100)]^2);
%zeta=0.707
num_nc=[1] %numerador da funcao nao compensada
den_nc=[1 1 0] %denominador da funcao nao compensada

funcao_nc=tf(num_nc, den_nc) %transforma em uma funcao de transferencia

%rlocus(funcao_nc) %mostra o LR
%sgrid(zeta,0) % Sobrepõe a reta de ultrapassagem
%percentual desejada.
%title(['LR sem compensação com ',num2str(OS),...
%'% de OS'])

PD_nao_comp=-0.54+0.887*i;
parte_real_nc= real(PD_nao_comp); %separa a parte real do PD
parte_im_nc= imag(PD_nao_comp); %separa a parte Imaginaria do PD

wn_nc = parte_real_nc/-zeta;
ts_nc = 4/ (wn_nc * zeta);

K_nc=-real(polyval(den_nc, PD_nao_comp)) %mostra o K do sistema 

%%% compensando

ts_comp = ts_nc
wn_comp = 4/(zeta*ts_comp)

%sin(3.62/7.947)
aux1=rad2deg(acos(3.62/7.947))
wd_comp=wn_comp*sin(acos(3.62/7.947))
