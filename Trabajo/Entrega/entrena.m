%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autores:	Luis José Quintana Bolaño
%			Javier Osuna Herrera
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Función que utiliza imágenes de coches para recortar la matricula y realizar
% el entrenamiento del reconocedor de letras, creando un archivo de Plantillas.
% Recibe la ruta de la carpeta en la que están las imágenes, terminada en "/".
%
function Plantillas = entrena (ruta)
	listafotos = dir(ruta);
	Totales = zeros(1,35);
	for i=3:size(listafotos,1) % Cargando y clasificando todas las fotos
    	fnombre = listafotos(i).name
        I = imread([ruta fnombre]);
        [M, T] = obtenerMatricula(I);
        C = obtenerCaracter(M);
        close all;
        for k=1:length(C)
        	Cn(:,:,k)=imresize(C{k}, [20 10]);
        end
        for j = 1 : size(Cn,3)
            aux = clasificaCaracter(Cn(:,:,j));
            Totales(aux)=Totales(aux)+1;
            Caractereres(:,:,aux, Totales(aux))= Cn(:,:,j);
    	end
	end
	Plantillas= generaPlantilla(Caracteres,Totales);  %Generando plantillas
	save('Plantillas.mat','Plantillas');
    close all;
end

%
% Recibe la imágen de un caracter y devuelve un número que corresponde a la
% posición del número/letra en la lista "1,...,9,A,...,Z,0".
%
function Num = clasificaCaracter( C )
	P1 = zeros(1,10); P2 = zeros(1,10);	P3 = zeros(1,10); P4 = zeros(1,10);
    for i=1:5 %Transforma la imágen en 4 vectores
		P1=P1 + C(i, :);
		P2=P2 + C(i+5, :);
		P3=P3 + C(i+10, :);
		P4=P4 + C(i+15, :);
	end
	%Codifica los 4 vectores a ún solo número único
    T1=codifica(P1); T2=codifica(P2); T3=codifica(P3); T4=codifica(P4);
	Cod=T1+(100*T2)+(10000*T3)+(1000000*T4)
    Num=compara(Cod); %Encuentra a qué caracter corresponde la codificación
end

%
% Recibe una matriz de caracteres ordenados y un vector con la cantidad total
% de muestras de cada caracter y genera las plantillas haciendo la media
% de cada caracter.
%
function Plantillas= generaPlantilla(Caracteres,Totales);
    for i=1:size(Caracteres,3);
    	aux=zeros(20,10);
        for j = 1 :Totales(i);%Suma de todas las muestras de cada caracter
            aux = aux + Caracteres(:,:,i, j);
        end
        for j=1:size(aux,1)	%Hace la media de cada caracter
        	for k=1:size(aux,2)
        		if aux(j,k)/Totales(i)>0.5
        			aux(j,k)=1;
        		else
        			aux(j,k)=0;
        		end
        	end
        end
        Plantillas(:,:,i)=aux; %Guarda la plantilla de cada caracter
    end
end

%
% Función que compara el código recibido con los correspondientes a cada letra
% y devuelve la posición de la adecuada en la lista "1,...,9,A,...,Z,0".
%
function letra = compara (N)
if N==2272202 
    letra=32
elseif N==31313114 || N== 13133302 || N== 7111114
    letra=1
elseif N==2311702 || N== 2210702 || N== 2211302
    letra=2
elseif N==2231102 || N== 2270702 || N== 14271102
    letra=3
elseif N==2021107 || N== 2275807 || N== 2271107 || N==2023127
    letra =4
elseif N== 2270202 || N== 14270202 || N== 14551402
    letra = 5
elseif N== 2271402 || N== 2331402 
    letra = 6
elseif N== 12272702 || N== 12212702 || N==27313302 || N== 12273302
    letra = 7
elseif N== 2290202 || N== 2020202 || N== 2330202
    letra = 8
elseif N== 2020202 || N== 2110202 
    letra = 9
elseif N== 2333131 || N== 2613127
    letra = 10% 'A'
elseif N== 2270202
    letra = 11% 'B'
elseif N== 2121202 
    letra = 12% 'C'
elseif N== 2272702
    letra = 13% 'D'
elseif N== 2141402
    letra = 14% 'E'
elseif N== 12141402
    letra = 15% 'F'
elseif N== 14275502 || N== 2272302 || N== 14236102
    letra = 16%'G'
elseif N== 27020227
    letra = 17%'H'
elseif N== 31313114 || N==14080808
    letra = 18%'I'
elseif N== 14272727 || N== 14553313
    letra = 19%'J'
    %###################################### K
elseif N== 2121212 
    letra = 21%'L'
elseif N==27232927
	%##################################### M
    letra = 23%'N'
elseif N==12120202
    letra = 24%'P'
elseif N==27140202
  	%#################################### Q
    letra = 25%'R'
elseif N==2072702
    letra = 26%'S'
elseif N== 33333302 || N== 23232302
    letra = 27%'T'
elseif N== 2272727 || N== 2279427
    letra = 28%'U'
elseif N== 31313327 
    letra = 29%'V'
elseif N== 58020261
    letra = 30%'W'
    %#################################### X
    %#################################### Y
elseif N== 2273302 || N== 2083102 || N== 2273314 || N== 14083102 || N== 2083302 || N== 2082702
    letra = 31%'Z'
else
	letra = 33
	disp(['ERROR, LETRA NO ENCONTRADA']);
	N
end
end
function Num = clasificaCaracter( C )
	P1 = zeros(1,10);
	P2 = zeros(1,10);
	P3 = zeros(1,10);
    for i=1:7
		P1=P1 + C(i, :);
		P2=P2 + C(i+7, :);
		P3=P3 + C(i+14, :);
	end
	P1
	P2
	P3
	Num=1;
    pause;
end

function Plantillas= generaPlantilla(Caracteres,Totales);
    for i=1:size(Caracteres,3);
        for j = 2 :Totales(i);
            aux = Caracteres(:,:,i, j) + Caracteres(:,:,i, j);
        end
        Plantillas(:,:,i)=aux/Totales(i);
    end
end
