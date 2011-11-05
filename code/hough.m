
function counter = hough(filename, rmin, rmax)
  img = img_preprocess(filename, rmin, rmax);
  [yy, xx] = find(img); % find the white points
  [sy, sx]=size(img); % get the dimension of the image


  total_pixel = length(xx);

  m_size = 2*rmax+1;
  r_size = rmax - rmin + 1;
  r_range = rmin:rmax;

  counter = zeros(sy,sx, r_size); % the accumulation matrix
  template = build_circle_template(rmin, rmax); % the circle template


  for i =1:total_pixel % travel for each white points (the points on edge)
    if (mod(i,1000)==0)
      disp(sprintf('i=%d', i))
    end
    for r_index = 1:r_size % iterate all possible radius
      r = r_range(r_index);
      x0 = xx(i) - r;
      y0 = yy(i) - r;
      x1 = xx(i) + r;
      y1 = yy(i) + r;
      %sx
      %sy
      %rmax+1-r
      %rmax+1+r
      if (x0 > 0 && y0 > 0 && x1 <= sx && y1 <= sy )
        counter(y0:y1, x0:x1, r_index) = counter(y0:y1, x0:x1, r_index) + template(rmax+1-r:rmax+1+r, rmax+1-r:rmax+1+r, r_index);
      end % if boundary check
    end % for r_index = 1:r_size
  end % for i=1:total_pixel

  disp(sprintf('i=%d', i))
  % find the local maxima in the counter
  %y0detect = []; x0detect = [];
  %AccumulatorbinaryMax = imregionalmax(counter);
  %imshow(AccumulatorbinaryMax);
  %[Potential_y0 Potential_x0] = find(AccumulatorbinaryMax == 1);
  %Accumulatortemp = counter - thresh;
  %for cnt = 1:length(Potential_y0)
  %  if Accumulatortemp(Potential_y0(cnt),Potential_x0(cnt)) >= 0
  %      y0detect = [y0detect;Potential_y0(cnt)];
  %      x0detect = [x0detect;Potential_x0(cnt)];
  %  end
  %end



end % function hough(filename)
