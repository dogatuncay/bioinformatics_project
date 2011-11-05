function [z0 , colony_number] = dec2(image_filename)
  [rmin, rmax] = get_radius_range(image_filename);
  rmin=round(1*rmin);
  %rmin=127;
  %rmax=1268;
  %rmin=round(0.5*rmin);
  rgb=imread(image_filename);
  gray = rgb2gray(rgb);
  level = graythresh(gray);
  bw = im2bw(gray, level);
  bw = 1-bw;

  %bw = img_filter(image_filename);
  %imshow(bw)
  [sy, sx]=size(bw);
  ny = floor(sy/rmin);
  nx = floor(sx/rmin);
  xrange = 1:nx;
  yrange = 1:ny;
  [X,Y]= meshgrid(xrange, yrange);
  Z = zeros(ny,nx);
  for iy = 1:ny
    for ix = 1:nx
      block = bw(((iy-1)*rmin+1):(iy*rmin), ((ix-1)*rmin+1):(ix*rmin));
      s =  sum(sum(block));
      Z(iy, ix) = s;
      %disp(sprintf('at block (%d, %d), sum is %d', iy, ix, s)) 
    end
  end
  %Z(ny,:)
  %mesh(X,Y,Z);

  threshold = mean(Z(find(Z>0)))/2;
  [yy, xx] = find(Z<threshold);
  for i = 1:length(yy)
    Z(yy(i), xx(i)) = 0;
  end
  %Z
  z1 = remove_border(Z);
  z0 = z1;
  %z0
  threshold = mean(z1(find(z1>0)));
  [yy, xx] = find(z1<threshold);
  for i = 1:length(yy)
    z1(yy(i), xx(i)) = 0;
  end
  z1;
  zmax = imregionalmax(z1);
  z2 = remove_duplicate(zmax);
  colony_number = sum(sum(z2));
  %show(sprintf('total colonies: %d', sum(sum(z2))))
  %imshow(zmax)
end
