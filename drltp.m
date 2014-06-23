%=================================================
%     Discriminative Robust Local Ternary Pattern (DRLTP)
%
%     Setup: 
%      circulo     R=1 
%      8 pixels    B=8
%      limiar LTP  T=9
%
%     DRLTP = concatenação [LRLBP, URLBP, LDLBP, UDLBP]
%
%=================================================
function drltp_data = drltp(im, block, bin)
      % 1: calcular LRLBP e URLBP
      llbp = lbp(im, block, "llbp", bin);
      ulbp = lbp(im, block, "ulbp", bin);

      lrlbp = min(ulbp{1}, llbp{1});
      urlbp = max(ulbp{1}, llbp{1});
      
      % 2: calcular hURLBP e hLRLBP
      grad = compute_gradient(im, block);
      hlrlbp = zeros([1,(2^8)-1]);      % 0 a 2^B-1
      for s=1:2^8
            for x=1:block(3)-1
                  for y=1:block(3)-1
                        hlrlbp(s) = grad(x,y)*(lrlbp(x,y) == s);
                  end;
            end;
      end;
      

endfunction;