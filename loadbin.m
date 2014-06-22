function bin = loadbin
%59 bins do LBP
bin = uniform_patterns(8);
endfunction;

%'CarData/TrainImages/pos-0.pgm'
% Calcular LTP da imgagem: 
%l = ltp(img, 8);



% Normaliza e salva imagem (apenas para debug)
%l_norm = l/255;
%imwrite(l_norm, 'lbp_out.png');

%W = computeGradient(block)
