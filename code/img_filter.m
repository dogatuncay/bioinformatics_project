
function h100 = img_filter(filename) 
  p1=20;
  p2=20;

  %rgb=imread('../new-pictures/0929-1690BImg_002.jpg');
  rgb = imread(filename);
  [yy,xx]=find(rgb(:,:,2)>=200);
  gg=rgb(:,:,1);
  %m = max(max(gg))
  m = mean(mean(gg))
  %imshow(gg)
  for i = 1:length(yy)
    y=yy(i);
    x=xx(i);
    gg(y,x) = m;
  end
  %figure
  %imshow(gg)
  g=double(gg);
  g6=g.^p1;
  g66=mat2gray(g6);
  g666=1-g66;
  h=g666;
  h10=h.^p2;
  h100=mat2gray(h10);
  %figure
  %imshow(h100);
end
