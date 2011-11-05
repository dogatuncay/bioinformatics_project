
function zin = remove_adjacent(i, j, zin, a, b, threshold)
  dy = [0, 0, 1, -1];
  dx = [1, -1, 0, 0];
  [m, n] = size(zin);
  %show(sprintf('in remove_adjacent(): starting from (%d,%d)', i,j));
  for ind = 1:length(dy)
    y = dy(ind);
    x = dx(ind);
    ny = i+y;
    nx = j+x;
    if (ny>0 && ny <= m && nx <=n && nx> 0 && ( zin(ny, nx) > 0) && ~(ny == a && nx == b))
      zin = remove_adjacent(ny, nx, zin,i,j, threshold );
    else if (ny ==a && nx ==b)
      %disp('cannot not go back to parent cell')
    end
  end
  if (~(i==a && j==b))
    zin(i,j)=0;
    %show(sprintf('in remove_adjacent(): clear (%d,%d) to 0', i,j));
  end
end
