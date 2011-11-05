[RGB,map]=imread('modified.jpg')
color = [ 0 255 0 ];
tol = 20;
isclose = ( abs(double(RGB(:,:,1)) - color(1))+ abs(double(RGB(:,:,2)) - color(2)) + abs(double(RGB(:,:,3)) - color(3)) ) <= tol;
   numclose = sum(isclose(:));
   numpixels = numel(RGB);
   proportion = numclose / numpixels;

   

