%=================================================
%
%
%                   PROJETO PDI
%         aluno: Leonardo Mendes Primo Brito
%
%
%
%=================================================
function sigma = sigma_hudlbp(m,n)
      if ((m==n) && (n>0))
            sigma = 1;
      elseif ((abs(m)==n) && (m<0))
            sigma = -1;
      else
            sigma = 0;
      endif;
endfunction;