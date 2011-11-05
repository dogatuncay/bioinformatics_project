
function img = img_preprocess(filename, rmin, rmax)
  rgb=imread(filename); % load data from image file

  im1=im2bw(rgb); % convert into black-white image

  im2=1-im1; % inverse the black and white color

  im3=edge(im2); % detect the edge
  [yy, xx] = find(im3); % get the position of edge points
  [sy, sx]=size(im3); % get the dimension of the image

  img=im3; % (rmin:sy-rmin, rmin:sx-rmin); % crop the marginal area
end
