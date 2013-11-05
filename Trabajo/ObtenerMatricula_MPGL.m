clear all
clc

cd RPtrain
A = imread(['Coche' num2str(31,'%03d') '.jpg']);
figure, imshow(A,[])
cd ..

B = rgb2gray(A);
%Operadores de Laplace
% h1 = [0 -1 0; -1 4 -1; 0 -1 0]/6;
% h2 = -1 * ones(3)/9;  h2(2,2) = 8/9;
% h3 = [-1 -2 -1; -2 12 -2; -1 -2 -1]/16;
h = butter(20,0.2,'high'); 
Fa = filter2(h, B);
figure, imshow(Fa, [])
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

FC = F(:, mu_sf-100:mu_sf+100);
sf = sum(FC');
sf = sf - min(sf); sf = sf / max(sf);
figure, plot(sf)

[sfo, sfoi] = sort(sf, 'descend');
mu_sf = mean(sfoi(3:6))
RF = RF(mu_sf-30:mu_sf+30, :);
figure, imshow(RF, [])