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
            %features{n} =  image_histogram(imgs{n},bin,tipo);
            ft(n,:) = image_histogram(imgs{n},bin,"ltp");
      end;
      

      %group = [ones(50, 1), zeros(50, 1)];
      group = [zeros(1,50) ones(1,50)]';
      svm = svmtrain(group,ft);
endfunction;