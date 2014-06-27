%Treinamento
function svm = svm_train(tipo,bin)
      imgs = load_images('treinamento');
      for n=1:numel(imgs)
            ntrain = n
            %features{n} =  image_histogram(imgs{n},bin,tipo);
            ft(n,:) = image_histogram(imgs{n},bin,tipo);
      end;
      group = [zeros(1,10) ones(1,10)]';
      svm = svmtrain(group,ft);
endfunction;