function [] = RecortaMatriculas()
    clear all
    clc

    cd RPtrain
    NIVEA = 29;
    A = imread(['Coche' num2str(NIVEA,'%03d') '.jpg']);
    figure, imshow(A,[])
    cd ..

    B = rgb2gray(A);
    figure, imshow(B, [])
    
    EB = imerode(B, ones(20));
    figure, imshow(EB, [])
    EB = imerode(B, zeros(3));
    figure, imshow(EB, [])
end