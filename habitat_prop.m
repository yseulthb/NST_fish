im_folder = 'C:/Users/preinstalled/PycharmProjects/pythonProject/fish_images/habitat_patches_6500x2400/';
addpath(im_folder);
im_files = dir (im_folder);
im_files = struct2cell(im_files(3:end));

kernel_sz = 400;
for im_ind = 1:6
    Image = imread(im_files{1,im_ind});
    ImageGS = Image(:,:,1) .* (299/1000) + Image(:,:,2) .* (587/1000) + Image(:,:,3) .* (114/1000);
    
%%lumMatch: outputImage = inputImage - np.mean2(inputImage) / np.std2(inputImage) * newSTD + newMEAN
    newMEAN = 140; %mean of meanlum
    newSTD  = 28; %mean of stdlum
    lumMatch = ((ImageGS - mean2(ImageGS) ) / std2(ImageGS)) * newSTD + newMEAN;
    
    meanlum(im_ind,2) = mean2(lumMatch);
    stdlum(im_ind,2) = std2(lumMatch);
    
    ndx = 0;
    img = ImageGS; %lumMatch;
    for startX = 1:kernel_sz:size(img, 1)-kernel_sz
        for startY = 1:kernel_sz:size(img, 2)-kernel_sz
            ndx = ndx + 1;
            sample = img(startX:startX+kernel_sz, startY:startY+kernel_sz);
            [logX, logY] = radialPsd2d(sample, size(sample,2)/2, 0);
            logX(isnan(logX))=[];
            logY(isnan(logX))=[];
            logX(isnan(logY))=[];
            logY(isnan(logY))=[];
            
            p    = polyfit(logX, logY,1);
            p(1) = p(1)*-1;
            
            slope2avg(im_ind,ndx) = p(1);
        end
    end
    
end

mean_slope(:,1) = mean(slope2avg,2);

%% Original images (color version)
% im_folder = 'C:/Users/preinstalled/PycharmProjects/pythonProject/fish_images/TrammelCreek/Habitat_patches_6500x2400';
% im_folder = 'C:/Users/preinstalled/Documents/PostDoc_Doc/StyleTransfer/WNxHabitat';
% im_folder = 'C:/Users/preinstalled/Documents/PostDoc_Doc/StyleTransfer/results_solo_pix/habitat_patches_6500x2400';
% im_folder = 'C:/Users/preinstalled/PycharmProjects/pythonProject/fish_images/olmstedi/habitat_e_olmstedi_PatuxentRiver_sand/Habitat_patches_6500x2400';
im_folder = 'C:/Users/preinstalled/Documents/PostDoc_Doc/StyleTransfer/results_solo_pix/styled_detouré';
% im_folder = 'C:/Users/preinstalled/Documents/PostDoc_Doc/StyleTransfer/results_solo_pix/original_detouré/CAER';
% im_folder = 'C:/Users/preinstalled/Documents/PostDoc_Doc/StyleTransfer/results_solo_pix/original_detouré';
addpath(im_folder);
im_files = dir (im_folder);
im_files = struct2cell(im_files(3:end));
% im_files = struct2cell(im_files(4:end-1)); %olmstedi fish

for im_ind = 1:length(im_files)
    Image = imread(im_files{1,im_ind});
    img_in = find(Image(:,:,:)<255); %for styled fish images only
%     img_in = find(Image(:,:,:)>0); %for original fish images only
    Image = Image(img_in);           %for fish images only
    
    meanlum(im_ind,1) = mean2(Image);
    stdlum(im_ind,1) = std2(Image);
    
    matofI(im_ind,:) = {im_files{1,im_ind} meanlum(im_ind,1) stdlum(im_ind,1)};
end
