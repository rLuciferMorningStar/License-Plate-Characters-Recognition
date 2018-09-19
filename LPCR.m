clc; close all; clear all;

%   Reading image
imagePath = 'Enter the absolute path of the "Images" folder';
imageName = 'car11.jpg';
image = imread([imagePath, imageName]);
%   Resizing image to perform operations
image = imresize(image, [480 NaN]);
%   Converting RGB image to grayscale for operations
imageGray = rgb2gray(image);
%   Binarizing grayscale image by thresholding using Otsu's Method
imageBin = imbinarize(imageGray);
%   Performing Sobel Edge Detection to identify the edges
imageSobel = edge(imageGray, 'sobel');
%   Performing morphological operations to enhance image for 
%   character retrieval
imageDilate = imdilate(imageSobel, strel('diamond', 2));
imageFill = imfill(imageDilate, 'holes');
imageErode = imerode(imageFill, strel('diamond', 10));
%   Finding location of the license plate in the image
Iprops=regionprops(imageErode,'BoundingBox','Area', 'Image');
area = Iprops.Area;
count = numel(Iprops);
maxa= area;
boundingBox = Iprops.BoundingBox;
for i=1:count
   if maxa<Iprops(i).Area
       maxa=Iprops(i).Area;
       boundingBox=Iprops(i).BoundingBox;
   end
end
%   Cropping image to get the license plate
imageCrop = imcrop(imageBin, boundingBox);
%   Resize license plate to 240 X NaN
imageResize = imresize(imageCrop, [240 NaN]);
%   Removing dust/noise
imageMorpho = imopen(imageResize, strel('rectangle', [4 4]));
%   Removing objects whose pixels are less than 500
imageRefine = bwareaopen(~imageMorpho, 500);
%   Storing height and width of the Refined Image
 [h, w] = size(imageRefine);

%imshow(imageRefine);

%	Reading each letter from Refined Image by measuring proprerties
Iprops = regionprops(imageRefine,'BoundingBox','Area', 'Image');
count = numel(Iprops);
% Initializing the variable of number plate string.
licensePlate = []; 
%   Retrieving character from the image by comparing each block
%   of image with the images in the template and storing the 
%   corresponding character into variable "licensePlate"
for i = 1:count
   objectWidth = length(Iprops(i).Image(1,:));
   objectHeight = length(Iprops(i).Image(:,1));
   if objectWidth < (h/2) && objectHeight > (h / 3)
       letter = readLetter(Iprops(i).Image); % Reading the letter corresponding the binary image 'N'.
       %figure; imshow(Iprops(i).Image);
       licensePlate = [licensePlate letter]; % Appending every subsequent character in licensePlate variable.
   end
end


