%=================================================
%           Segmentar imagem em blocos
%      
%      Obter todos os blocos 8x8 da imagem.
%
%      Os blocos são deslocados com overlap de 50% em
%      ambas as direções, i.e. as posições dos blocos
%      (considerando o canto superior esquerdo) serão:
%
%      linha 1: (0,0), (4,0), (8,0), ... 
%      linha 2: (0,4), (4,4), (8,4), ...
%
%=================================================
function b = get_blocks(im)
      
      blockdim = 8;

      imres_x = size(img)(2); % res horizontal
      imres_y = size(img)(1); % res vertical

      x_step = y_step = blockdim/2; % 50% overlap

      nblocks_x = imres_x/x_step;
      nblocks_y = imres_y/y_step;
      
      % num total de blocos = 8*nblocks_x 8*nblocks_y
      b = zeros([blockdim*nblocks_x, blockdim*nblocks_y]);    
      
      idx = 1;
      
      for x = 1:x_step
            for y=1:y_step
                  b(idx++) = im(x:(x+blockdim), y:(y+blockdim));
            end;
      end;
endfunction;