function C = obtenerCaracter (I)
	BC = imadjust(I, [0 1], [1 0]);
	%BC=im2bw(BC);
	figure, imshow(BC);
	%bw = im2bw(BC, graythresh(BC));
	bw = im2bw(BC, 0.8);
	figure, imshow(bw);
   % cc = bwconncomp(bw);
    %lblMatrix = labelmatrix(cc);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% CROPPED IMAGE DILATION IMPACT :
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%img_crop_dil = imdilate(bw,strel('square',2)); %% Dilate image using square Str element
%figure;imshow(img_crop_dil);title(' Dilated LP ');   %% Display image

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Dilated CROPPED IMAGE FILLING :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%img_crop_fill = imfill(img_crop_dil,'holes'); %% Image Filling with holes
%figure;imshow(img_crop_fill);title(' Dilated Filled With Holes LP');%%Display image

%[row_img_crop_fill col_img_crop_fill] = size(img_crop_fill);
%[Ilabel num] = bwlabel(img_crop_fill); %% labelling connected objects
[Ilabel num] = bwlabel(bw);
stat = regionprops(Ilabel);

%    nLabels = max(lblMatrix(:));
%    figure, imshow(bw);
%    for lbl = 1 : nLabels
%        currentObject = lblMatrix == lbl;
%        lblMatrix(imerode(currentObject, strel('disk', 1))) = 0;
%    end
%    stat = regionprops(lblMatrix,'boundingbox');

    figure, imshow(I); hold on;
        for cnt = 1 : numel(stat)
        	bb = stat(cnt).BoundingBox;
        	rectangle('position',bb,'edgecolor','b','linewidth',2);
        end
    hold off;
    [x,y]=size(bw)
    for cnt = 1 : numel(stat)
        bb = stat(cnt).BoundingBox
        if(bb(1,4)>(x/2))
        C{cnt}=imcrop(I,bb);
        figure, imshow(C{cnt});
    end

end