
function [z] = dec3()
  image_filename = { '../new-pictures/0929-1680BImg_001.jpg', '../new-pictures/0929-1680BImg_002.jpg', '../new-pictures/0929-1687BImg_001.jpg', '../new-pictures/0929-1687BImg_002.jpg', '../new-pictures/0929-1690BImg_001.jpg', '../new-pictures/0929-1690BImg_002.jpg', '../new-pictures/0929-59BImg_001.jpg', '../new-pictures/0929-59BImg_002.jpg', '../new-pictures/0929-908BImg_002.jpg'};
  file_range = 1:length(image_filename);
  file_range = [3];
  for file_id = file_range
    filename = image_filename(file_id);
    name = char(filename);
    [z, num] = dec2(name);
    total_pixel = sum(sum(z));
    disp(sprintf('file %s has %d colonies and %d pixels, average size is %d', name, num, total_pixel, total_pixel/num))
    return
  end
end

