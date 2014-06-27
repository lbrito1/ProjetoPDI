function svm = test_true(tipo)
      bin = loadbin;
      model = svm_train(tipo,bin);
      imgs_teste = load_images('teste');
      numel(imgs_teste)
      
      a = get_true_locations;
      
      for n=1:170
            n;
            x = a(n,2);
            y = a(n,1);
            img = imgs_teste{n};
            imres_x = size(img)(2); % res horizontal
            imres_y = size(img)(1); % res vertical
            
            if (n!=6) && (n!=17) && (x*y>0) && (x+100<=imres_x) && (y+40<imres_y)
                  n
                  svm{x} = svm_classify_img(tipo,model,x,y,img,bin);
                  save svm_output.txt svm -append
            endif;
      end;
      
endfunction