function [rmin, rmax] = get_radius_range(image_filename)
    graph_array=imread(image_filename);
    %figure;
    %imshow(graph_array(:,:,2));
    A=graph_array(:,:,2);

    count=0;
    count_max=0;
    a=size(A);
    for n=1:a(1)       
        for j=1:a(2)
            if A(n,j,:)>252
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