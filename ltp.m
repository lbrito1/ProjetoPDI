%=================================================
%     Local Ternary Pattern (LTP)
%
%     Setup: 
%      circulo     R=1 
%      8 pixels    B=8
%      limiar LTP  T=9
%
%=================================================
function h = ltp(im, blockdim, bin, robust)
      llbp = lbp(im, blockdim, "llbp", bin);
      ulbp = lbp(im, blockdim, "ulbp", bin);
      
      if (robust)
            urlbp = max(
      endif;
      
      h = ltp_hist = [llbp{2}, ulbp{2}];
      bar(ltp_hist,1.0);      %produz histograma
      colormap(hsv(12));
endfunction;