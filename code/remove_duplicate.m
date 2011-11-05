
function zin = remove_duplicate(zin)
  [m,n] = size(zin);
  [yy, xx] = find(zin);
  for ind = 1:length(yy)
    y = yy(ind);
    x = xx(ind);

    if (zin(y,x) > 0)
      %show(sprintf('(%d,%d)=%d', y,x,zin(y,x)))
      zin = remove_adjacent(y, x, zin, y, x, 2);
      zin(y,x) = 1;
    end
  end


end
