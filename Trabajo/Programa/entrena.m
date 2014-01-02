function []=entrena()
    A=0;
    for i = 1 : 172
        I = imread(['RPtrain/Coche' num2str(i,'%03d') '.jpg']);
        [M, T] = obtenerMatricula(I);
        figure, imshow(M);
        if T==true
        	A=A+1;
        end
        close all;
    end
end
    