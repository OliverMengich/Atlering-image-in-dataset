%%
image = imread('0CXDTY.jfif');
image = imresize(image,[227 227]);
imagehsv = rgb2hsv(image);
imwrite(imagehsv,'0CXDTY.jpg');


%%

rootfolder =fullfile('folderx');
imSet = imageSet(rootfolder);
%%
while ~isDone(imSet)
    [image,inf] = readImage(imSet);
    image = imresize(image,[227 227]);
    [x,y,z] = size(image);
    if z ~=3
        mask = zeros(size(image));
        mask(25:end-25,25:end-25)=1;
        bw = activecontour(image,mask,200,'Chan-Vese');
        imwrite(bw,inf.Filename);
    else
        Im = rgb2hsv(image);
        imwrite(Im,inf.Filename);
    end
    
    
end

%%
while hasdata(imSet)
   
    
    
end