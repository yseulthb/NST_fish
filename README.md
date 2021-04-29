# NST_fish
Prep scripts for the images fed to the NST algorithm

IMAGE PROCESSING BEFORE FEEDING THE STYLE TRANSFER ALGORITHM

HABITAT IMAGES:
1. Download RAW data from Sam's drive (Images) = .CR2 format
	- into a RAW folder
2. Execute the Raw2tiff.py script to transform images in a tiff format while performing white balance
	- into a whitebalance folder
3. Crop the images to get a 6500x 2400 patch 
	- Notebook: Habitat_ImageProcessing.ipynb
5. Choose a couple of images from various habitat types or fish individuals and give them to the Style Transfer algorithm:
	- Notebook: neural_style_preserve_color.ipynb (to run on colab)
6. Check the average pixel intensity value of each habitat image to match adequately a gravel vs sand pair.
	- matlab code habitat_prop.m
