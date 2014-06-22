diary off

%========================================
%     APLICACAO DO LTP, RLTP E DRLTP
%========================================

% Carregar imagem
img = imread('CarData/TrainImages/pos-0.pgm');
img_res = size(img);
imshow(img)
img = double(img);


% Calcular LTP da imgagem
%l = ltp(img, img_res);

%59 bins do LBP
bins = uniform_patterns(8);

% Normaliza e salva imagem (apenas para debug)
%l_norm = l/255;
%imwrite(l_norm, 'lbp_out.png');

%W = computeGradient(block)
