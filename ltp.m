
%     Projeto PDI - Leonardo Brito

%=================================================
%     Local Ternary Pattern (LTP)
%     
%     Setup: 
%      circulo     R=1 
%      8 pixels    B=8
%      limiar LTP  T=9
%
%=================================================
function ltp_data = ltp(im, blockdim)
llbp = lbp(im, blockdim, "llbp");
ulbp = lbp(im, blockdim, "ulbp");
ltp_data = {llbp, ulbp};
endfunction;