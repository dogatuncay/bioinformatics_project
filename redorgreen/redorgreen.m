%The following code can be used to separate red and green pixels
%from an image. It is based on color distance transform.


%%%%%%input arguments

%input=image to be inspected.
%TR= Threshold value for red component.
%TG=Threshold value for green component.
%T2= Threshold value for the result.

%%%%%%%%%%% output arguments
%IR=red image
%IG=green image


%%%%%example:-
% redorgreen('abc.jpg',240,240,170)



function [IR,IG]=redorgreen(input,TR,TG,T2)
%Check whether correct number of arguments are supplied.
error(nargchk(4,4,nargin));
%Read the image.
I=imread(input);
%Extract red, Green and Blue Part.
R=double(I(:,:,1));
G=double(I(:,:,2));
B=double(I(:,:,3));
%Compute the color distances.
DR=sqrt(double((R-TR).^2 + (G-0).^2 +(B-0).^2));
DG=sqrt(double((R-0).^2+(G-TG).^2+(B-0).^2));
IR=zeros(size(I,1),size(I,2),3);
IG=zeros(size(I,1),size(I,2),3);
for y=1:1:size(I,1)
    for x=1:1:size(I,2)
        % If distance of this pixel rom red color is lesss than threshold,
        % Mark it red.
       if(DR(y,x)<T2) 
           IR(y,x,1)=255;
           IR(y,x,2)=0;
           IR(y,x,3)=0;
       end
        % If distance of this pixel rom Green color is lesss than threshold,
        % Mark it Green.
       if(DG(y,x)<T2) 
           IG(y,x,1)=0;
           IG(y,x,2)=255;
           IG(y,x,3)=0;
       end
    end
end
imtool(I);
%Display the resulting red and green pixels.
figure,title('Red Pixels'),imshow(IR);
figure,title('Green Pixels'),imshow(IG);
end