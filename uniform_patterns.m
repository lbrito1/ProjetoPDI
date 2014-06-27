%=================================================
%
%
%                   PROJETO PDI
%         aluno: Leonardo Mendes Primo Brito
%
%
%
%=================================================
function bin = uniform_patterns(samples)

bin = 0:2^samples-1;
newMax  = 0; %number of patterns in the resulting LBP code
index   = 0;

newMax = samples*(samples-1) + 3; 
  for i = 0:2^samples-1
    j = bitset(bitshift(i,1,samples),1,bitget(i,samples)); 
    numt = sum(bitget(bitxor(i,j),1:samples));
    if numt <= 2
      bin(i+1) = index;
      index = index + 1;
    else
      bin(i+1) = 0;
    end
  end
end