%=================================================
%     Local Ternary Pattern (LTP)
%
%     Setup: 
%      circulo     R=1 
%      8 pixels    B=8
%      limiar LTP  T=9
%
%=================================================
function h = ltp(im, block, type, bin)
      llbp = lbp(im, block, "llbp", bin);
      ulbp = lbp(im, block, "ulbp", bin);
      
      switch(type)
            case "rltp"
                  lrlbp = min(ulbp{1}, llbp{1});
                  urlbp = max(ulbp{1}, llbp{1});
                  
                  hl = zeros([1,59]);
                  hu = zeros([1,59]);
                  
                  for x=1:numel(lrlbp)
                        hl(bin(lrlbp(x)+1)) += 1;
                        hu(bin(urlbp(x)+1)) += 1;
                  end;
                  h = ltp_hist = [hl,hu];
            case "ltp"
                  h = ltp_hist = [llbp{2}, ulbp{2}];
      endswitch;
      bar(ltp_hist,1.0);      %produz histograma
      colormap(hsv(12));
endfunction;