%Función que recibe la fotografía de un coche, recorta la matrícula y la devuelve. También devuelve 
function [M, T] = obtenerMatricula(Im)
		T=false; % 
        hsdf = rgb2hsv(Im);
        hsdf(:, :, 2) = hsdf(:, :, 2) * 2.5;
        I = hsv2rgb(hsdf);
        
        bw = im2bw(I, graythresh(I));
        cc = bwconncomp(bw);
        lblMatrix = labelmatrix(cc);
        nLabels = max(lblMatrix(:));
        
        for lbl = 1 : nLabels
            currentObject = lblMatrix == lbl;
            lblMatrix(imerode(currentObject, strel('disk', 1))) = 0;
        end
        stat = regionprops(lblMatrix,'boundingbox');
        
        %imshow(I); hold on;
        %for cnt = 1 : numel(stat)
        %	bb = stat(cnt).BoundingBox;
        %	rectangle('position',bb,'edgecolor','b','linewidth',2);
        %end
        %hold off;
        shpNum = 0;
        RM = 0;
        for cnt = 1 : numel(stat)
            bb = stat(cnt).BoundingBox;
            if (bb(1,3) < 300 && bb(1,3) > 90 && bb(1,4) < 70 && bb(1,3) / bb(1,4) > 3.5 && bb(1,3) / bb(1,4) < 6.2)%bb(1,3) / bb(1,4) > 4 && bb(1,3) / bb(1,4) < 6.2)
                %x = bb(1,1);
                %y = bb(1,2);
                %Color = impixel(I,x + 2,y + 2);
                %rectangle('position',bb,'edgecolor','b','linewidth',2);
                Maux=imcrop(Im,bb);
                if(shpNum>0)
                	Raux=ruido(Maux);
                	if(Raux>RM)
                		RM=Raux;
                		M=Maux;
                	end
                else
                	M=Maux;
                	RM=ruido(Maux);
                end
                shpNum = shpNum + 1;
            end
        end
        if shpNum~=0
        	subplot(1,2,1),subimage(Im)
        	subplot(1,2,2),subimage(M)
        	opcion=questdlg('¿Aceptar matricula?','Aceptar matricula','Si','No','Si');
        	if strcmp(opcion,'No')
        		shpNum=0;
        	else
        		T=true;
        	end
        end
        if shpNum==0
        	figure, M=imcrop(Im);
        end
end

function M = ruido(B)
	BC = imadjust(B, [0 1], [1 0]);
	BC=im2bw(BC);
    %%%%%%%%%%%%%%%%%%%%figure, imshow(BC, [])
    %EB = imerode(BC, ones(4));
    %figure, imshow(EB, [])
    %EB=imcomplement(EB);
    %DM = imdilate(EB, ones(20));
    %figure, imshow(DM, [])
    fil=fspecial('sobel');
    BR=imfilter(BC,fil);
    %%%%%%%%%%%%%%%%%%%%figure, imshow(BR, [])
    
    %Fa=DM;
    %F=Fa(:,10:length(Fa) - 10);
	sf = sum(BR); 
	sf = sf - min(sf); sf = sf / max(sf);
	M=mean(sf);
	if(isnan(M))
		M=0;
	end
	%%%%%%%%%%%%%%%%%%%%figure, plot(sf)
end
