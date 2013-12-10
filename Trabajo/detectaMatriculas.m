%Grupo Gayumbos: Luís José Quintana Bolaño y Javier Osuna Herrera
%La función detecta rectangulos y los dibuja en azul. Entre ellas, las
%matriculas

function [] = detectaMatriculas()
    clear all
    close all
    clc
    
    cd RPtrain
    for i = 40 : 40
        I = imread(['Coche' num2str(i,'%03d') '.jpg']);
        hsdf = rgb2hsv(I);
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
    
        imshow(I); hold on;
        shpNum = 0;
        for cnt = 1 : numel(stat)
            bb = stat(cnt).BoundingBox;
            if (bb(1,3) < 300 && bb(1,3) > 70 && bb(1,4) < 70 && bb(1,3) / bb(1,4) > 4 && bb(1,3) / bb(1,4) < 6.2)
                x = bb(1,1);
                y = bb(1,2);
                Color = impixel(I,x + 2,y + 2);
                rectangle('position',bb,'edgecolor','b','linewidth',2);
                shpNum = shpNum + 1;
            end
        end
        pause
        
    end
    cd ..
end