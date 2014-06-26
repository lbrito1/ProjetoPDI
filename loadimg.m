% Carregar todas as imagens duma pasta
function imgs = loadimg(path)
      d = dir([path,"*.pgm"]);
      imgs = cell(1,numel(d));
      for (i = 1:numel(d))
            i
            imgs{i} = imread([path,d(i).name]);
            imgs{i} = double(imgs{i});
      end;
endfunction;
