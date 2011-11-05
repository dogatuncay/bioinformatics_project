

function count = detect(filename)
  filename30 = '../pictures/0929-1687BImg_002.jpg';
  filename10 = '../pictures/0929-1680BImg_001.jpg';
  filename11 = '../pictures/z1.jpg';
  filename31 = '../pictures/z3.jpg';
  filename = filename31;
  count = hough(filename, 120, 130);
  img = img_preprocess(filename, 120, 130);
  find_peaks(count, 120, 130, img);
end


