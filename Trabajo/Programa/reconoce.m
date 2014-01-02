function Mtext = reconoce (Inom)
    A=0;
    I = imread(Inom);
    [M, T] = obtenerMatricula(I);
    figure, imshow(M);
    if T==true
        A=A+1;
    end
    disp([num2str(A) '/' num2str(i) '=' num2str(A*100/i)]);
    C = obtenerCaracter(M);
    Mtext = reconocerCaracter(C);
    pause;
    close all;
end
