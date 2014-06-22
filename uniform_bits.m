function uniform_bits(bits)
    nnz(diff(bits([1:end, 1]))) == 2;
end