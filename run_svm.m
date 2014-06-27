%Treinamento
function svm = run_svm(treinamento, tipo)
      if (treinamento)
            imgs = load_images('treinamento');
      else
            imgs = load_images('teste');
      end;
      bin = loadbin;

      for n=1:10
            n
            %features{n} =  image_histogram(imgs{n},bin,tipo);
            ft(n,:) =  image_histogram(imgs{n},bin,"ltp");
      end;
      

      %group = [ones(50, 1), zeros(50, 1)];
      group = [zeros(5,1) ones(5,1)];
      svm = svmtrain(ft,group);
endfunction;