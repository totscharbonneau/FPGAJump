from PIL import Image

tiles_images_dir = "../tiles_images/"

# Convert hex color to 12 bits color code (3 bits for r, g and b)
def hex_to_12bits(r, g, b):
    return (r//8 << 8 + g//8 << 4 + b//8)

# Extract 12 bits color code from an image
def get_pixelmap_color_code_from_img(pixelmap, img_dir):
    img = Image.open(img_dir)
    pixel_map = img.load()
    width, height = img.size

    for y in range(height):
        for x in range(width):
            r, g, b, a = pixel_map[x, y]
            pixelmap[x,y] = hex_to_12bits(r, g, b)

# For every sub_directory in directory
    # Write to file the name of directory
    # For every image in directory
        # Write to file the tile_id
        # Write to file pixelmap color code on 12 bits
        



