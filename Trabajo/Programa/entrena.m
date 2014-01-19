function Plantillas = entrena (ruta)
listafotos = dir(ruta);
Totales = zeros(1,35);
for i=3:size(listafotos,1)
    fnombre = listafotos(i).name
            I = imread([ruta fnombre]);
            [M, T] = obtenerMatricula(I);
            C = obtenerCaracter(M);
        for k=1:length(C)
        	C{k} = imadjust(C{k}, [0 1], [1 0]);
            C{k} = im2bw(C{k}, 0.75);
            Cn(:,:,k)=imresize(C{k}, [30 20]);
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
    Abs=Total/600
    P1=sum(sum(C(1:10, 1:20)));
    P1=P1/Total
    P2=sum(sum(C(11:20, 1:20)));
    P2=P2/Total
    P3=sum(sum(C(21:30, 1:20)));
    P3=P3/Total
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
