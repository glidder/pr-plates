function Plantillas = entrena (ruta)
	listafotos = dir(ruta);
	Totales = zeros(1,35);
	for i=3:size(listafotos,1)
    	fnombre = listafotos(i).name
        I = imread([ruta fnombre]);
        [M, T] = obtenerMatricula(I);
        C = obtenerCaracter(M);
        close all;
        for k=1:length(C)
        	Cn(:,:,k)=imresize(C{k}, [21 10]);
        end
        for j = 1 : size(Cn,3)
            aux = clasificaCaracter(Cn(:,:,j));
            Totales(aux)=Totales(aux)+1;
            Caractereres(:,:,aux, Totales(aux))= Cn(:,:,j);
    	end
	end
	Plantillas= generaPlantilla(Caracteres,Totales);
	save('Plantillas.mat','Plantillas');
    close all;
end

function Num = clasificaCaracter( C )
	P1 = zeros(1,10);
	P2 = zeros(1,10);
	P3 = zeros(1,10);
    for i=1:7
		P1=P1 + C(i, :);
		P2=P2 + C(i+7, :);
		P3=P3 + C(i+14, :);
	end
	P1
	P2
	P3
	Num=1;
    pause;
end

function Plantillas= generaPlantilla(Caracteres,Totales);
    for i=1:size(Caracteres,3);
        for j = 2 :Totales(i);
            aux = Caracteres(:,:,i, j) + Caracteres(:,:,i, j);
        end
        Plantillas(:,:,i)=aux/Totales(i);
    end
end
