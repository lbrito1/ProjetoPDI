%=================================================
%     Local Ternary Pattern (LTP)
%     
%     Setup: 
%      circulo     R=1 
%      8 pixels    B=8
%      limiar LTP  T=9
%
%=================================================
function ltp_hist = ltp(im, blockdim, bin)
      llbp = lbp(im, blockdim, "llbp", bin);
      ulbp = lbp(im, blockdim, "ulbp", bin);

      ltp_hist = llbp{2} + ulbp{2};
      
endfunction;