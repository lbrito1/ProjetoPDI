%=================================================
%
%
%                   PROJETO PDI
%         aluno: Leonardo Mendes Primo Brito
%
%
%
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
%      * bin: padrões uniformessss
%      * type: tipo de histograma a ser calculado:
%            - LTP: concatenação [LLBP, ULBP]
%            - RLTP: concatenação [LRLBP, URLBP]
%            - DRLTP: concatenação [LRLBP, URLBP, LDLBP, UDLBP]
%
%=================================================
function h = image_histogram(im, bin, type)
      blocks = get_blocks(im);
      switch (type)
            case "ltp"
                  for x = 1:numel(blocks)
                  %x
                  %number_of_blocks = numel(blocks)
                  %blocks{x}
                        block_hist_list{x} = ltp(blocks{x}, "ltp", bin);
                        %block_hist_list{x}
                  end;
            case "rltp"
                  for x = 1:numel(blocks)
                        block_hist_list{x} = ltp(blocks{x}, "rltp", bin);
                  end;
            case "drltp"
                  number_of_blocks = numel(blocks)
                  for x = 1:numel(blocks)
                        %printf("\n%d de %d blocos DRLTP",x,numel(blocks));
                        %printf("\nDRLTP: %d/%d",x,numel(blocks));
                        block_hist_list{x} = drltp(blocks{x}, bin);
                  end;
      endswitch;
      
      idx = 1;
      for x = 1:numel(block_hist_list)
            blockhist = block_hist_list{x};
            normV = norm(blockhist,1);
            if normV > 0,  % Or some other threshold, like EPS
                  uV = blockhist/normV;
            else
                  uV = blockhist;  % Do nothing since it's basically 0
            end;
            blockhist = sqrt(uV);
            for y = 1:numel(blockhist)
                  h(idx++) = blockhist(y);
            end;
      end;
endfunction;