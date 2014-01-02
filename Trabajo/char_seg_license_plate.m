
%%%%%
%Characters Segmentation Of Cropped License Plate (LP) From A Vehicle Using
%Morphological Processing.
%   How to use:
%   1-Make sure License_Plate.MAT file must be in your present working
%   directory. 
%%%%%

clc;clear all; close all;

load License_Plate;        %%% Load License Plate(LP) image to workspace
img_crop = img_Lic_Plate;  %%% Assign loaded LP image to a new variable
[row_img_crop_fill col_img_crop_fill] = size(img_crop);
figure;imshow(img_crop);title ('Acquired License Plate Image'); %Display image

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% CROPPED IMAGE DILATION IMPACT :
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

img_crop_dil = imdilate(img_crop,strel('square',2)); %% Dilate image using square Str element
figure;imshow(img_crop_dil);title(' Dilated LP ');   %% Display image

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Dilated CROPPED IMAGE FILLING :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

img_crop_fill = imfill(img_crop_dil,'holes'); %% Image Filling with holes
figure;imshow(img_crop_fill);title(' Dilated Filled With Holes LP');%%Display image

[row_img_crop_fill col_img_crop_fill] = size(img_crop_fill);
[Ilabel num] = bwlabel(img_crop_fill); %% labelling connected objects
Iprops = regionprops(Ilabel);            
Ibox   = [Iprops.BoundingBox];         %% Selecting BoundingBox measurement
Ibox = reshape(Ibox,[4 length(Ibox)/4]); 
figure; cnt_subplot = 0;% counter for subplot command

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Character Segmentation :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Extracting Numbers And Character From License Plate

for cnt = 1:length(Ibox) 
    rectangle('position',Ibox(:,cnt),'edgecolor','r'); %%% Rectangle as BoundingBox
    out= ceil(Ibox(1:2,cnt))';
    
    % Boundary Coordinates for connected objects
    start_OCR_col = out(1,1); start_OCR_row = out(1,2);
    end_OCR_col = start_OCR_col + ceil(Ibox(3,cnt))-1 ; 
    end_OCR_row = start_OCR_row + ceil(Ibox(4,cnt))-1 ;
    
    % Crop characters based upon top and bottom boundary coordinates 
    img_crop_char = img_crop_fill(start_OCR_row :end_OCR_row, start_OCR_col:end_OCR_col);
    %figure;imshow(img_crop_char);  %% uncomment this line to see individual cropped characters       
    [pixel_rows(1,cnt) pixel_cols(1,cnt)] = size(img_crop_char) ;
    
    %%% Code for enhanced character extraction based upon width and height
    %%% of template character size.It tends to reject unwanted components.
       
    if(and(pixel_rows(1,cnt) >= 40, pixel_cols(1,cnt) >=15 )) && ....
      ( pixel_cols(1,cnt) <= round(col_img_crop_fill - .1*col_img_crop_fill) ) % to check character Atleast less than 10% of cols of image
        cnt_subplot = cnt_subplot + 1 ;  
        subplot(1,5,cnt_subplot);imshow(img_crop_char);
    end  % if ends here
    
 end % for ends here
 