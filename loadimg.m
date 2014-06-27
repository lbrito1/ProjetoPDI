% Carregar todas as imagens duma pasta
function imgs = loadimg(path)
      d = dir([path,"*.pgm"]);
      imgs = cell(1,numel(d));
      for (k = 1:numel(d))
            k
            cam = [path,d(k).name]
            imgs{k} = imread([path,d(k).name]);
            imgs{k} = double(imgs{k});
      end;
endfunction;
