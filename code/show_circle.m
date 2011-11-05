
function show_circle(rmin, rmax, m, index)
  r_range = rmin:rmax;
  r = r_range(index);

  low = rmax+1-r;
  high = rmax+1+r;

  data = m(low:high, low:high, index);
  imshow(data);
end

