% Carregar todas as imagens duma pasta
function imgs = loadimg(path)
d = dir([path,"*.pgm"]);
imgs = cell(1,numel(d));
for (i = 1:numel(d))
      imgs{i} = imread([path,d(i).name]);
end;
%imshow(img);
