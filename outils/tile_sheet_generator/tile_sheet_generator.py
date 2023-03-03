from PIL import Image

tiles_images_dir = "../tiles_images/"
generated_tiles_name = "generated_tiles.txt"
file = open(tiles_images_dir + generated_tiles_name, 'w')

# Convert hex color to 9 bits color code (3 bits for r, g and b)
def hex_to_9bits(r, g, b):
    return (r//32 << 6 | g//32 << 3 | b//32)

# write 16x16 tiles color code to file
def write_to_file_pixelmap_color_code_from_img(img_dir, name) -> None:
    img = Image.open(tiles_images_dir + img_dir)
    width, height = img.size
    
    # Only for background
    if name == 'background':
        images = image_to_16x16_tiles(width, height, img)
        w = 0
        h = 0
        for image in images:
            write_to_file(get_16x16_RGB_pixel_map(image.load()), name + ' '+str(w//16)+' '+str(h//16) + ' :')
            if w == width:
                w = 0
                h += 16
            else:
                w += 16
    else:
        write_to_file(get_16x16_RGB_pixel_map(img.load()), name + ' 0 0 :')

# return the RGB pixel map on 9 bits, but it must be in 16x16 pixel format
def get_16x16_RGB_pixel_map(img_pixel_map):
    RGB_pixel_map = []
    for y in range(16):
            for x in range(16):
                r, g, b = img_pixel_map[x, y]
                RGB_pixel_map.append(hex_to_9bits(r, g, b))
    return RGB_pixel_map

# writes all 16x16 tiles to a single file. Format : Name - 16x16 RGB data - ; (end)
def write_to_file(pixel_map, name) -> None:
    file.write(name + '\n')
    index = 0
    for data in pixel_map:
        if index == 15:
            file.write((str(data)) + '\n')
            index = 0
        else:
            file.write((str(data)) + ' ')
            index += 1
    file.write(';\n')

# Convert bigger image to a list of 16x16 images
def image_to_16x16_tiles(width, height, img):
    images = []
    for y in range(0, height, 16):
        for x in range(0, width, 16):
            images.append(img.crop([x,y,x+16,y+16]))        
    return images
    
# Add new tiles here
def main():
    tiles_dir = [
        'player/player.png', 'platform/left/platform_left.png',
        'platform/mid/platform_mid.png', 'platform/one_tile/platform_one_tile.png',
        'platform/right/platform_right.png', 'background/background.png'
    ]
    write_to_file_pixelmap_color_code_from_img(tiles_dir[0], 'player')
    write_to_file_pixelmap_color_code_from_img(tiles_dir[1], 'platform_left')
    write_to_file_pixelmap_color_code_from_img(tiles_dir[2], 'platform_mid')
    write_to_file_pixelmap_color_code_from_img(tiles_dir[3], 'platform_one_tile')
    write_to_file_pixelmap_color_code_from_img(tiles_dir[4], 'platform_right')
    write_to_file_pixelmap_color_code_from_img(tiles_dir[5], 'background')
    if not file.closed:
        file.close()
    
if __name__ == '__main__':
    main()
