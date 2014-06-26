%Treinamento
function svm = run_svm(treinamento, tipo)
      if (treinamento)
            imgs = load_images('treinamento');
      else
            imgs = load_images('teste');
      end;
      bin = loadbin;

      for n=1:100
            n
            features{n} =  image_histogram(imgs{n},bin,tipo);
      end;

      group = [ones(50, 1), zeros(50, 1)];
      svm = svmtrain(features,group);
endfunction;