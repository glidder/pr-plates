function Plantillas = recorta (ruta)
	listafotos = dir(ruta);
	Totales = zeros(1,35);
	Tname=0;
	for i=3:size(listafotos,1)
    	fnombre = listafotos(i).name
        I = imread([ruta fnombre]);
        [M, T] = obtenerMatricula(I);
        C = obtenerCaracter(M);
        close all;
        for k=1:length(C)
        	imwrite(C{k},sprintf('Letras/%d.bmp',Tname));
        	Tname=Tname+1;
        end
    end
end
