
function H= find_peaks(count, rmin, rmax, img)
  r_size = rmax-rmin;
  for i = 1:r_size
    H(i) = max(max(count(:,:,i)));
  end
  plot(H,'*-');

  return;

  [maxval, maxind] = max(H)
  [B,A] = find(count(:,:,maxind)==maxval);
  %size(B)
  %size(A)
  B
  A
  imshow(img); hold on;
  plot(mean(A),mean(B),'xr')
  text(mean(A),mean(B),num2str(maxind),'color','green')
  disp(sprintf('the radius is %d, origin is (y= %d, x= %d)', rmin+maxind-1, B,A)) 
end
