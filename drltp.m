%=================================================
%           Discriminative Robust Local Ternary Pattern (DRLTP)
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
      
      %otimização
      gradmat = zeros(6);
      for x=1:6
            for y=1:6
                  gradmat(x,y) = grad(x,y);
            end;
      end;
      
      for s=1:255
            for x=1:6
                  for y=1:6
                        binpos = bin(s);  %1-57
                        if(binpos != 0)
                              if (s!=255)
                                    hlrlbp(binpos) += grad(x,y)*(lrlbp(x,y) == binpos);
                                    hldlbp(binpos) += grad(x,y)*sigma_hldlbp(lambda_hldlbp(ulbp{1},llbp{1}),binpos);
                              elseif (s!=1)
                                    hurlbp(binpos) += grad(x,y)*(urlbp(x,y) == binpos);
                                    hudlbp(binpos) += grad(x,y)*sigma_hudlbp(lambda_hudlbp(ulbp{1},llbp{1}),binpos);
                              endif;
                        endif;
                  end;
            end;
      end;
      
      % Módulo (ver equações 21 e 22)
      hldlbp = abs(hldlbp);
      hudlbp = abs(hudlbp);
      
      % Concatenação
      drltp_data = [hurlbp, hlrlbp, hldlbp, hudlbp];
endfunction;