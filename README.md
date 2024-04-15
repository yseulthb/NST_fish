# NST_fish
This repo contains the procedure and scripts used to create "styled" fish images using the Neural Style Transfer (NST) algorithm with the colour preservation implementation (Gatys et al, 2016). 


FEEDING THE NST ALGORITHM <br>

1. Choose a couple of images from the Raw Images folder (one habitat and one fish image) and give them to the Style Transfer algorithm.
	- Notebook: neural_style_preserve_color.ipynb (to run on colab)

2. Check the average pixel intensity value of each habitat image to match adequately a gravel vs sand pair
	- Matlab code habitat_prop.m

FIsh animations: <br>

3. Fish animations were later created with the Blender animation software. Fish were given a path to follow and a video background to render a more naturalistic visual stimulation.  	
