	clear all
    clc
    for i = 1 : 172
    	cd ..
    	cd RPtrain
        I = imread(['Coche' num2str(i,'%03d') '.jpg']);
        cd ..
        cd Programa
        M = obtenerMatricula(I);
        figure, imshow(M);
        pause;
        close all;
    end
    
