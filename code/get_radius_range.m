function [rmin, rmax] = get_radius_range(image_filename)
  rgb=imread(image_filename);
  g=rgb(:,:,2);
  bw=im2bw(g);
  [yy,xx]=find(bw);
  freq_table = tabulate(yy);
  value = max(freq_table(:,2));
  rmax = value;
  rmin = ceil(rmax/10);
  return
  

  % following are Zheng's code.
  count=0;
  count_max=0;
  a=size(g);
  for n=1:a(1)       
    for j=1:a(2)
      if g(n,j,:)>252
        count=count+1;
      end    
    end
    if count > count_max
      count_max=count;
    end
    count=0;
  end
  rmin=count_max(1)*0.1;
  rmax=count_max(1);
end
