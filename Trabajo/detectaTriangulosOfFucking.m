function [] = detectaTriangulosOfFucking()
    clear all
    close all
    clc
    
    cd RPtrain
    NIVEA = 29;
    %for i = 1 : 20
    I = imread(['Coche' num2str(NIVEA,'%03d') '.jpg']);
    cd ..
    
    %Ibw = rgb2gray(I);
    %figure, imshow(Ibw);
    %Ifill = imfill(Ibw,'holes');
    %figure, imshow(Ifill);
    %Iarea = bwareaopen(Ifill,100);
    %figure, imshow(Iarea);
    %Ifinal = bwlabel(Iarea);
    %figure, imshow(Ifinal);
    %stat = regionprops(Ifinal,'boundingbox');
    
    bw = im2bw(I, graythresh(I)); %<-------- La mejor hasta ahora
    bw = imfill(bw,'holes');
    cc = bwconncomp(bw);
    stat = labelmatrix(cc);
    figure, imshow(stat,[])
    stat = regionprops(stat,'boundingbox');
    
    figure, imshow(I); hold on;
    shpNum = 0;
    for cnt = 1 : numel(stat)
        bb = stat(cnt).BoundingBox;
        if (bb(1,3)<800)
            x = bb(1,1);
            y = bb(1,2);
            Color = impixel(I,x + 2,y + 2);
            rectangle('position',bb,'edgecolor','b','linewidth',2);
            shpNum = shpNum + 1;
        end
    end
    %formatSpec = 'There are %d rectangles \n';
    %fprintf(formatSpec,shpNum);
    %end
end