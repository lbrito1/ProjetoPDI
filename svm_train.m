%Treinamento
function svm = svm_train(tipo,bin)
      imgs = load_images('treinamento');
      for n=1:numel(imgs)
            n
            %features{n} =  image_histogram(imgs{n},bin,tipo);
            ft(n,:) = image_histogram(imgs{n},bin,tipo);
      end;
      group = [zeros(1,50) ones(1,50)]';
      svm = svmtrain(group,ft);
endfunction;