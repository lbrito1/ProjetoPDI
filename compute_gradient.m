%%      Projeto - Processamento de Imagens - CIn/UFPE
%%      Sérgio Renan Vieira - Engenharia da Computação
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function W = compute_gradient(im, block)
% %================================================================
% %================================================================
% 
% Função que computa a magnitude do gradiente de um pixel de um bloco 8x8
% de uma imagem.
%  
% Entrada: Imagem e bloco (x,y,dim)
% Saída: BLoco com magnitude do gradiente de cada pixel (onde é possível). 
% 
% A função realiza o cálculo através das máscaras derivativas 1-D centra-
% das no ponto.
% 
% %================================================================
% %================================================================

h1 = [-1 0 1];
h2 = [1 0 -1]';
W = zeros(8, 8);

for x = block(1)+2:block(3)
      dx = x - 1; 
      for y = block(2)+2:block(3)
            dy = y - 1;
                  
            ROIx = im(x, dy:(dy + 2));
            ROIy = im(dx:(dx + 2), y);

            Ix= sum(h1.*ROIx);
            Iy= sum(h2.*ROIy);

            W(dx, dy) = sqrt(Ix^2 + Iy^2);
      end;
end;







