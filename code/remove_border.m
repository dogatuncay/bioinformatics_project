
function zout = remove_border(zin) 
  zout = zin;
  [m,n] = size(zin);
  threshold = mean(mean(zin));
  % horizon
  for i = [1,m]
    for j = 1:n
      if (zout(i,j) > 0)
        %disp([i,j])
        zout = remove_adjacent(i,j, zout, i, j, threshold);
      end
    end
  end

  % vertical
  for i = 1:m
    for j = [1,n]
      if (zout(i,j) > 0)
        zout = remove_adjacent(i,j, zout, i, j, threshold);
      end
    end
  end


  zout(1,:) = 0;
  zout(:,1) = 0;
  zout(m,:) = 0;
  zout(:, n) = 0;
end
