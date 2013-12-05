function [] = RecortaMatriculas()
    clear all
    clc
    
    cd RPtrain
    NIVEA = 29;
<<<<<<< HEAD
    A = imread(['Coche' num2str(31,'%03d') '.jpg']);
    figure, imshow(A,[])
    cd ..

    B = rgb2gray(A);
    
    BC = imadjust(B, [0 1], [1 0]);
    BC=im2bw(BC);
    figure, imshow(BC, [])
    EB = imerode(BC, ones(4));
    figure, imshow(EB, [])
    EB=imcomplement(EB);
    DM = imdilate(EB, ones(20));
    figure, imshow(DM, [])
    fil=fspecial('sobel');
    BR=imfilter(DM,fil);
    figure, imshow(BR, [])
    
    
    
    Fa=DM;
    F=Fa(:,10:length(Fa) - 10);
sf = sum(F); 
sf = sf - min(sf); sf = sf / max(sf);
figure, plot(sf)

[sfo, sfoi] = sort(sf, 'descend');
sfoil = [];
aux = 1;
for i = 1 : length(sfoi)
    if sfo(i) >= (sfo(1) * 0.65)
        sfoil(aux) = sfoi(i);
        aux = aux + 1;
    end
end

%Temporal version QuintanaAlfa

[minY, minI] = min(sfoil, [], 2);
[maxY, maxI] = max(sfoil, [], 2);
%mu_sf = mean(sfoi(3:6))
%RF = B(:, mu_sf-100:mu_sf+100);
RF = B(:, minY(1):maxY(1));
figure, imshow(RF, [])

FC = F(:, minY(1):maxY(1));
sf = sum(FC');
sf = sf - min(sf); sf = sf / max(sf);
figure, plot(sf)

[sfo, sfoi] = sort(sf, 'descend');
sfoil = [];
aux = 1;
for i = 1 : length(sfoi)
    if sfo(i) >= (sfo(1) * 0.65)
        sfoil(aux) = sfoi(i);
        aux = aux + 1;
    end
end
[minY, minI] = min(sfoil, [], 2);
[maxY, maxI] = max(sfoil, [], 2);
%mu_sf = mean(sfoi(3:6))
%RF = RF(mu_sf-30:mu_sf+30, :);
FF = RF(minY(1):maxY(1),:);
figure, imshow(FF, [])
=======
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
	
>>>>>>> ce707ab05c564504278e291d2857fd233a186365
end