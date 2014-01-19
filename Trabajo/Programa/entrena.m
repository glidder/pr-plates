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
	C
    Total=sum(C(:));
    Abs=Total/210
    P1=sum(sum(C(1:7, 1:10)));
    P1=P1/210
    P2=sum(sum(C(8:14, 1:10)));
    P2=P2/210
    P3=sum(sum(C(15:21, 1:10)));
    P3=P3/210
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
