from PIL import Image
import os

# Load the image
image_path = 'compass_atlas.png'  # Replace with the path to your image
image = Image.open(image_path)

# Ensure the image size is 16x512
assert image.size == (16, 512), "The image size must be 16x512 pixels."

# Create a directory to save the 16x16 images
output_dir = 'output_images'
os.makedirs(output_dir, exist_ok=True)

# Split the image into 16x16 pieces and save each piece
for i in range(32):  # 512 / 16 = 32
    box = (0, i * 16, 16, (i + 1) * 16)
    piece = image.crop(box)
    piece.save(os.path.join(output_dir, f'compass_{i}.png'))

print(f'Successfully split the image into {i+1} pieces and saved them in the "{output_dir}" directory.')
