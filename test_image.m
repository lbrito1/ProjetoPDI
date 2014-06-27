%=================================================
%      Calcular histogramas de imagem de teste
%      utilizando janelas     
%     
%      Calcular o histograma das janelas do tamanho
%      das imagens de teste, i.e. 100x40 pixels.
%
%      Stride horizontal: 5pix
%      Stride vertical: 2 pix
%
%      Entrada:
%      * im: imagem
%      * bin: padrões uniformessss
%      * type: tipo de histogramas a serem calculados
%            - LTP: concatenação [LLBP, ULBP]
%            - RLTP: concatenação [LRLBP, URLBP]
%            - DRLTP: concatenação [LRLBP, URLBP, LDLBP, UDLBP]
%
%=================================================
function window_hist = test_image(im, bin, type)
      windows = get_windows(im);
      nwindows = numel(windows)
      switch (type)
            case "ltp"
                  for x = 1:numel(windows)
                  x
                        window_hist{x} = image_histogram(windows{x}, bin, "ltp");
                  end;
            case "rltp"
                  for x = 1:numel(windows)
                  x
                        window_hist{x} = ltp(windows{x}, bin, "rltp");
                  end;
            case "drltp"
                  number_of_blocks = numel(windows)
                  for x = 1:numel(windows)
                  drltp_it = x
                        window_hist{x} = drltp(windows{x}, bin);
                  end;
      endswitch;
endfunction;