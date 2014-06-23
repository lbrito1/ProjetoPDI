%=================================================
%     Local Binary Pattern (LBP)
%     
%     Setup: 
%      circulo     R=1 
%      8 pixels    B=8
%      limiar LTP  T=9
%
%     Entrada:
%      im: imagem (double)
%      block: (x,y,z) posição 0,0 e dimensão (e.g. (0,0,8))
%      type: "lbp", "rlbp", "llbp" ou "ulbp"     
%      bin: 59 bins dos padrões binários uniformes
%
%     Saída:
%      {lbpval, lbphist} (fixo em 59 bins
%      para imagens de 8bits (0-255))   
%     
%
%=================================================
function lbp_hist = lbp(im, block, type, bin)

lbp_hist = {zeros(block(3)-2,block(3)-2), zeros([1,59])}; 
T = 9;      % limiar do LTP

xs = block(1)+2;
xe = xs + block(3)-3;

ys = block(2)+2;
ye = ys + block(3)-3; 

for x = xs:xe
      dx = x - 1; 
    
      for y = ys:ye;
            dy = y - 1;
        
            %   sb = subbloco 3x3 
            %   e.g.
            %         7   8   9
            %         1   2   3
            %         4   5   6
            sb = im(dx:(dx + 2), dy:(dy + 2));
            
            % neighbors = vizinhos ordenados em sentido anti-horário
            % e.g.  1   4   7   8   9   6   3   2
            neighbors = [sb(1,1),sb(2,1),sb(3,1),sb(3,2),sb(3,3),sb(2,3),sb(1,3),sb(1,2)];
            
            % Diferença Pb-Pc
            %
            % No caso LBP, temos T = 0.
            % Nos casos LLBP e ULBP:
            %
            %     *--------------*--------------*
            %    -T              0              T
            %  
            % ULBP: s(z) = 1 se z >= T, senão 0.
            % LLBP: s(z) = 1 se -z >= T, senão 0
            switch (type)
                  case "lbp" 
                        deltaP = (neighbors - im(x, y)) >= 0;
                  case "rlbp" 
                        deltaP = (neighbors - im(x, y)) >= 0;
                  case "ulbp"
                        deltaP = (neighbors - im(x, y)) >= T;
                  case "llbp"
                        deltaP = -(neighbors - im(x, y)) >= T;
            endswitch;
                  

            % find = índices dos elementos não-nulos do vetor
            % e.g. x = 4 0 5 0 0 --> find(x) = 1 3
            % abs (x-8) = complemento
            s = abs(find(deltaP) - 8);
            
            lbp_val = sum(2.^s);         
            
            switch (type)
                  case "rlbp"
                        lbp_val = min(lbp_val,255-lbp_val);
            endswitch;
            
            % valor final LBP
            lbp_hist{1}(x-1, y-1) = lbp_val;
            
            % atualizar histograma
            lbp_hist{2}(bin(lbp_val+1)) += 1;
      end;
end;