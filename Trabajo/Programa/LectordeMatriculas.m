	clear all
    clc
    A=0;
    for i = 1 : 172
        I = imread(['RPtrain/Coche' num2str(i,'%03d') '.jpg']);
        [M, T] = obtenerMatricula(I);
        figure, imshow(M);
        if T==true
        	A=A+1;
        end
        disp([num2str(A) '/' num2str(i) '=' num2str(A*100/i)]); 
        %pause;
        close all;
    end
    
