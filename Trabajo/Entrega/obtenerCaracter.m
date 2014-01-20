%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autores:	Luis José Quintana Bolaño
%			Javier Osuna Herrera
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Función que recibe la imagen de una matrícula y devuelve un vector de imágenes
% de los caracteres.
%
function C = obtenerCaracter (I)
	%__________________________________Preprocesado de la imagen
	[xt,y,z]=size(I);
	I=I(:,round(y*0.03):y-round(y*0.03),:);
	figure, imshow(I);
	BC = imadjust(I, [0 1], [1 0]);
	figure, imshow(BC);
	bw = im2bw(BC, 0.75);
	figure, imshow(bw);
	%__________________________________Busqueda de componentes conexos
	[Ilabel num] = bwlabel(bw);
	stat = regionprops(Ilabel);

MAUX=0;
[x,y]=size(bw);
for cnt = 1 : numel(stat)
	bb = stat(cnt).BoundingBox;
	if(bb(1,4)>(x/2) && bb(1,3)>1 && bb(1,3)<(y/5) && bb(1,4)<round(xt*0.95))
		MAUX=MAUX+1;
	end
end
if (MAUX<6) %%%% En caso de que el primer filtro no funcione, se repite ajustandolo
	bw = im2bw(BC, 0.6);
	figure, imshow(bw);
	[Ilabel num] = bwlabel(bw);
	stat = regionprops(Ilabel);
end
    figure, imshow(I); hold on;
        for cnt = 1 : numel(stat)
        	bb = stat(cnt).BoundingBox;
        	rectangle('position',bb,'edgecolor','b','linewidth',2);
        end
    hold off;
    [x,y]=size(bw);
    aux=1;
    for cnt = 1 : numel(stat) % Comprueba y recorta en su caso cada caja encontrada
        bb = stat(cnt).BoundingBox;
        if(bb(1,4)>(x/2) && bb(1,3)>1 && bb(1,3)<(y/5) && bb(1,4)<round(xt*0.95))
        C{aux}=imcrop(bw,bb);
        aux=aux+1;
        figure, imshow(C{aux-1});
        end
    end

end
