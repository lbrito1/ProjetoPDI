function imlist = load_images(type)
      switch(type)
            case "treinamento"
                  imlist = loadimg('CarData\TrainImages\');
            case "teste"
                  imlist = loadimg('CarData\TestImages\');
      endswitch;
endfunction;