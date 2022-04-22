%Funcao em s da planta
funcNC=tf(1.0352*1,[1 1 0]);

Ts=0.01;
funNCz=c2d(funcNC,Ts); %funcao em z da planta
MFNCz=feedback(funNCz,1) %obtendo funcao em malha fechada para a funcao NC
step(MFNCz)

hold on


funcC=tf(10.15*[1 1],[1 1.08]);%funcao em s do compensador

funCz=c2d(funcC,Ts); %funcao em z do compensador

Gez=funNCz*funCz %multiplicacao da planta com o compensador Z

MFz=feedback(Gez,1) %obtém a função de transferência em malha fechada
step(MFz);
legend('Não Compensado Digital','Resposta do sistema digital');


hold off
