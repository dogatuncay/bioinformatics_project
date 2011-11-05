pomegranate = imread('C:\Users\zhdong\Documents\Fall 2010\I617-BioInformatics\project\input-pictures\0929-1687BImg_001.jpg');
%subplot(2,2,1), image(pomegranate), title('Image (RGB)');
%subplot(2,2,2), imshow(pomegranate(:,:,1)), title('Intensity Image: Red Layer');
%subplot(2,2,3), imshow(pomegranate(:,:,2)), title('Intensity Image: Green Layer');
%subplot(2,2,4), imshow(pomegranate(:,:,3)), title('Intensity Image: Blue Layer');
figure
imshow(pomegranate(:,:,2))
A=pomegranate(:,:,2)
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
        max_n=n;
    end
    count=0;
end