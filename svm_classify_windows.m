function svm = svm_classify_windows(model, window, type, bin)
   %   switch (type)
  %          case "ltp"
 %                 ft = image_histogram(window, bin, "ltp");
 %           case "rltp"
%                  ft = ltp(window, bin, "rltp");
%            case "drltp"
%                  ft = drltp(window, bin);
%      endswitch;

      fts = test_image(im, bin, type);
      lb = zeros([numel(fts),1]);
      for x=1:numel(lb)
            svm(x) = svmpredict([0], fts{x}, model);
      end;
endfunction;