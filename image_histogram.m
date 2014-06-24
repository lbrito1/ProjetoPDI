%=================================================
%           Calcular histograma de uma imagem
%     
%      Calcular o histograma dos blocos 8x8 de uma 
%      imagem em formato double e depois os concatena
%      para formar o histograma da imagem completa.
%
%      Os blocos são deslocados com overlap de 50% em
%      ambas as direções, i.e. as posições dos blocos
%      (considerando o canto superior esquerdo) serão:
%
%      linha 1: (0,0), (4,0), (8,0), ... 
%      linha 2: (0,4), (4,4), (8,4), ...
%
%      Entrada:
%      * im: imagem
%      * bin: padrões uniformes
%      * type: tipo de histograma a ser calculado:
%            - LTP: concatenação [LLBP, ULBP]
%            - RLTP: concatenação [LRLBP, URLBP]
%            - DRLTP: concatenação [LRLBP, URLBP, LDLBP, UDLBP]
%
%=================================================
function h = image_histogram(im, bin, type)
      
      
endfunction;