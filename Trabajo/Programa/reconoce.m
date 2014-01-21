function Mtext = reconoce (Inom)
    I = imread(Inom);
    [M, T] = obtenerMatricula(I);
    figure, imshow(M);
    C = obtenerCaracter(M);
    Mtext='';
    for k=1:length(C)
        	Mtext=[ Mtext ' ' reconocerCaracter(imresize(C{k}, [21 10]))];
    end
    Mtext
    pause;
    close all;
end

function T = reconocerCaracter(C)
	load('Plantillas.mat');
	comp=[ ];
	for n=1:length(Plantillas)
    	sem=corr2(Plantillas(:,:,n),C); 
    	comp=[comp sem]; 
	end
	N=find(comp==max(comp));
	T=encuentra(N);
end

function letra = encuentra (N)
if N==32
    letra= '0'
elseif N==1
    letra='1'
elseif N==2
    letra='2'
elseif N==3
    letra='3'
elseif N==4
    letra ='4'
elseif N== 5
    letra = '5'
elseif N== 6
    letra = '6'
elseif N== 7
    letra = '7'
elseif N== 8
    letra = '8'
elseif N== 9
    letra = '9'
elseif N== 10
    letra ='A'
elseif N== 11
    letra = 'B'
elseif N== 12
    letra = 'C'
elseif N== 13
    letra = 'D'
elseif N== 14
    letra = 'E'
elseif N== 15
    letra = 'F'
elseif N== 16
    letra = 'G'
elseif N== 17
    letra ='H'
elseif N== 18
    letra ='I'
elseif N== 19
    letra = 'J'
    %###################################### K
elseif N== 21
    letra ='L'
elseif N==23
    %##################################### M
    letra ='N'
elseif N==24
    letra ='P'
elseif N== 25
      %#################################### Q
    letra ='R'
elseif N==26
    letra ='S'
elseif N== 27
    letra ='T'
elseif N== 28
    letra ='U'
elseif N== 29
    letra ='V'
elseif N== 30
    letra = ‘'W'
    %#################################### X
    %#################################### Y
elseif N== 31
    letra ='Z'
else
	disp(['ERROR, LETRA NO ENCONTRADA']);
	N
end
end
