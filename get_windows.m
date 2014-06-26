%=================================================
%           Segmentar imagem em janelas
%      
%      Obter lista de janelas 100x40 da imagem.
%      Strides: 5 horizontal, 2 vertical
%
%=================================================
function w = get_windows(im)
      
      w_width = 100;
      w_height = 40;

      imres_x = size(im)(2) % res horizontal
      imres_y = size(im)(1) % res vertical

      x_step = 5;
      y_step = 2;

      nwindows_x = floor((imres_x-w_width)/x_step)
      nwindows_y = floor((imres_y-w_height)/y_step)
      nwindows = nwindows_x*nwindows_y
      
      w = cell([1,nwindows]); % lista de blocos    
      
      idx = 1;
      for y = 0:nwindows_y-2
            for x = 0:nwindows_x-2
            x
            y
                  w_x = max(x*x_step,1);
                  w_y = max(y*y_step,1);
                  w{idx++} = im(w_y:(w_y+w_height-1),w_x:(w_x+w_width-1));
            end;
      end;
      
      %temporário - padding dos blocos
      for idx=idx:numel(w) 
            w{idx} = zeros([8,8]);
      end;
      
endfunction;