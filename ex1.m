diary off

img = imread('CarData/TrainImages/pos-0.pgm');

img_res = size(img);

imshow(img)

img = double(img);

% Bloco 8x8 ao redor do ponto xy
block = img(1:8, 1:8)

% Calcular LBP da imgagem
l = lbp(img, img_res);

% Normaliza e salva imagem (apenas para debug)
l_norm = l/255;
imwrite(l_norm, 'lbp_out.png');

% 
W = computeGradient(block)
