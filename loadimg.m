% Carregar imagem
function img = loadimg(path)
img = imread(path);
%imshow(img);
img = double(img);