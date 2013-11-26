function [] = RecortaMatriculas()
    clear all
    clc
    
    cd RPtrain
    NIVEA = 29;
    for i = 1 : 20
    A = imread(['Coche' num2str(i,'%03d') '.jpg']);
    %figure, imshow(A,[])
    %cd ..

    %B = rgb2gray(A);
    %figure, imshow(B, [])
    
    %NB = imadjust(B, [0 1], [1 0]);
    %figure, imshow(NB, [])
    
    %EB = imerode(NB, ones(5));
    %figure, imshow(EB, [])
    
    %bw = im2bw(A, graythresh(A)); <-------- La mejor hasta ahora
    %cc = bwconncomp(bw);
    %lblMatrix = labelmatrix(cc);
    %figure, imshow(lblMatrix,[])
    
    %edgeMatrix=edge(lblMatrix,'log',0);
    %figure, imshow(edgeMatrix)
    
    %bw = im2bw(A, graythresh(A)); <------------ Esta puede
    %cc = bwconncomp(bw);
    %lblMatrix = labelmatrix(cc);
    %nLabels = max(lblMatrix(:));
    %for lbl = 1 : nLabels
    %    currentObject = lblMatrix == lbl;
    %    lblMatrix(imerode(currentObject, strel('disk', 1))) = 0;
    %end
    %figure, imshow(label2rgb(lblMatrix), [])
    
    bw = im2bw(A, graythresh(A));
    cc = bwconncomp(bw);
    lblMatrix = labelmatrix(cc);
    [gx, gy] = gradient(lblMatrix);
    lblMatrix((gx.^2+gy.^2)==0) = 0;
    figure, imshow(label2rgb(lblMatrix), [])
    
    end
    cd ..
	
end