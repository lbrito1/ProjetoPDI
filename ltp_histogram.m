function hist = ltp_histogram(impath)
      img = loadimg(impath);
      bin = loadbin;
      ltp_histogram = ltp(img, 8, bin);
      
endfunction;