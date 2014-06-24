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
function drltp_data = drltp(block, bin)
      % 1: calcular LRLBP e URLBP
      llbp = lbp(block, "llbp", bin);
      ulbp = lbp(block, "ulbp", bin);

      lrlbp = min(ulbp{1}, llbp{1});
      urlbp = max(ulbp{1}, llbp{1});
      
      % 2: calcular hURLBP, hLRLBP, hldlbp e hudlbp
      grad = compute_gradient(block);
      hlrlbp = zeros([1,(2^8)-1]);      % 0 a 2^B-1
      hurlbp = zeros([1,(2^8)-1]);      % 1 a 2^B
      
      hudlbp = zeros([1,(2^8)-1]);      % 0 a 2^B-1
      hldlbp = zeros([1,(2^8)-1]);      % 1 a 2^B
      
      for s=1:2^8-1
            for x=1:6
                  for y=1:6
                        if (s!=2^8)
                              hlrlbp(s) += grad(x,y)*(lrlbp(x,y) == s);
                              hldlbp(s) += grad(x,y)*sigma_hldlbp(lambda_hldlbp(ulbp{1},llbp{1}),s);
                        elseif (s!=1)
                              hurlbp(s) += grad(x,y)*(urlbp(x,y) == s);
                              hudlbp(s) += grad(x,y)*sigma_hudlbp(lambda_hudlbp(ulbp{1},llbp{1}),s);
                        endif;
                  end;
            end;
      end;
      
      % Módulo (ver equações 21 e 22)
      hldlbp = abs(hldlbp);
      hudlbp = abs(hudlbp);
      
      drltp_data = {hurlbp, hlrlbp, hldlbp, hudlbp};
      
      
endfunction;