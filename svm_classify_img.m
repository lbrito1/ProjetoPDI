function svm = svm_classify_img(tipo,model,x,y,img,bin)
      x_step = 5;
      y_step = 2;
      w_width = 100;
      w_height = 40;
      
      window = img(y:(y+w_height-1),x:(x+w_width-1));
      
      
      switch (tipo)
            case "ltp"
                  w = image_histogram(window, bin, "ltp");
            case "rltp"
                  w = image_histogram(window, bin, "rltp");
            case "drltp"
                  w = image_histogram(window, bin,"drltp");
      endswitch;
      
      svm = svmpredict([0], w, model);
endfunction;