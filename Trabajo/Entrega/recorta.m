%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autores:	Luis José Quintana Bolaño
%			Javier Osuna Herrera
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Función que recorta y guarda las letras de todas las imágenes guardadas
% en el directorio recibido como parametro.
%
function Plantillas = recorta (ruta, ruta2)
	listafotos = dir(ruta);
	Totales = zeros(1,35);
	Tname=0;
	Acierto=0;
	for i=3:size(listafotos,1) %Cargando y recortando todas las fotos
    	fnombre = listafotos(i).name
        I = imread([ruta fnombre]);
        [M, T] = obtenerMatricula(I);
        if(T==true)
        	Acierto=Acierto+1;
        end
        C = obtenerCaracter(M);
        close all;
        if length(C)>0
        for k=1:length(C) %Guardando todas las imágenes
        	imwrite(C{k},[ruta2 '/' ruta2 sprintf('%d.bmp',Tname)]);
        	Tname=Tname+1;
        end
        end
    end
    Acierto
end
