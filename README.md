# NST_fish
This repo contains the procedure and scripts used to create "styled" fish images using the Neural Style Transfer (NST) algorithm with the colour preservation implementation (Gatys et al, 2016). 
This serves two purposes: code sharing as favoured by open science practice and archive to enable future experiments in the lab using the same tool when I am no longer there. 

Raw images are not provided given their size but the script is provided for transparency purposes. 

IMAGE PROCESSING BEFORE FEEDING THE STYLE TRANSFER ALGORITHM <br>
Habitat images: <br>
1. Download RAW data (.CR2 format)
2. Execute the Raw2tiff.py script to transform images in a tiff format while performing white balance and save them into a whitebalance folder
3. Crop the images to get a 6500x 2400 patch 
	- Notebook: Habitat_ImageProcessing.ipynb

Fish images:<br>

4. Fish images were originally cropped, but later detoured using GIMP and directly given as an input to the NST algorithm. In case cropping code is useful to anyone, here it is
	- Notebook: Fish_ImageProcessing.ipynb

FEEDING THE NST ALGORITHM <br>

5. Choose a couple of images from various habitat types or fish individuals and give them to the Style Transfer algorithm.
	- Notebook: neural_style_preserve_color.ipynb (to run on colab)

6. Check the average pixel intensity value of each habitat image to match adequately a gravel vs sand pair
	- Matlab code habitat_prop.m

FIsh animations: <br>

7. Fish animations were later created with the Blender animation software. Fish were given a path to follow and a video background to render a more naturalistic visual stimulation.  	
