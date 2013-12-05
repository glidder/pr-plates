function [] = DeCuandoChaendlerSeQuedoAtrapadoEnUnBanco()
    clear all
    clc
    
    cd RPtrain
    NIVEA = 29;
    %for i = 1 : 20
    A = imread(['Coche' num2str(NIVEA,'%03d') '.jpg']);
    figure, imshow(A,[])
    cd ..
    
    BW = im2bw(A, 1);
    figure, imshow(BW, [])
    %end
end