function imlist = load_images(type)
      switch(type)
            case "treinamento"
                  imlist = loadimg('CarData\TrainImages\');
            case "teste"
                  
                  path = ('CarData\TestImages\0\');
                  d = dir([path,"*.pgm"]);
                  
                  imgs = cell(1,numel(d));
                  
                  for (k = 1:numel(d))
                        k
                        cam = [path,d(k).name]
                        imgs{k} = imread([path,d(k).name]);
                        imgs{k} = double(imgs{k});
                  end;
                  
                  z = 10;
                  
                  path = ('CarData\TestImages\10\');
                  d = dir([path,"*.pgm"]);
                  for (k = 1:numel(d))
                        z++
                        cam = [path,d(k).name]
                        imgs{z} = imread([path,d(k).name]);
                        imgs{z} = double(imgs{z});
                  end;
                  
                  z = 100;
                  
                  path = ('CarData\TestImages\100\');
                  d = dir([path,"*.pgm"]);
                  for (k = 1:numel(d))
                        z++
                        cam = [path,d(k).name]
                        imgs{z} = imread([path,d(k).name]);
                        imgs{z} = double(imgs{z});
                  end;
                  imlist = imgs;
      endswitch;
endfunction;