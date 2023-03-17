from PIL import Image

tile_id = 1
tiles_images_dir = "../tiles_images/"
generated_tiles_name = "generated_c_code.txt"
file = open(generated_tiles_name, 'w')

# Convert hex color to 9 bits color code (3 bits for r, g and b)
def hex_to_9bits(r, g, b):
    return (r//32 << 6 | g//32 << 3 | b//32)

# write 16x16 tiles color code to file
def write_to_file_pixelmap_color_code_from_img(img_dir, name):
    img = Image.open(tiles_images_dir + img_dir)
    write_to_file(get_16x16_RGB_pixel_map(img.load()), name)

# return the RGB pixel map on 9 bits, but it must be in 16x16 pixel format
def get_16x16_RGB_pixel_map(img_pixel_map):
    RGB_pixel_map = []
    for y in range(16):
            for x in range(16):
                r, g, b = img_pixel_map[x, y]
                RGB_pixel_map.append(hex_to_9bits(r, g, b))
    return RGB_pixel_map

# writes all 16x16 tiles to a single file. Format : Name - 16x16 RGB data - ; (end)
def write_to_file(pixel_map, name):
    global tile_id
    file.write("// " + name + " " + str(tile_id) + "\n")
    index = 0
    for data in pixel_map:
        ending = " "
        if (index % 15) == 0 and index != 0:
            ending = "\n"
        file.write("this->pixelmap[" + str(index) + "] = " + str(data) + ";" + ending)
        index += 1    
    file.write("set_element_tile_id(tile_id_list, " + str(tile_id) + ", " + name + ");\n")
    file.write("send_tile_export(api, " + str(tile_id) + ", this->pixelmap);\n")
    tile_id += 1

# Convert bigger image to a list of 16x16 images
def image_to_16x16_tiles(width, height, img):
    images = []
    for y in range(0, height, 16):
        for x in range(0, width, 16):
            images.append(img.crop([x,y,x+16,y+16]))        
    return images
    
# Add new tiles here
def main():
    write_to_file_pixelmap_color_code_from_img('player/player.png', 
                                               'PLAYER_TILE')
    write_to_file_pixelmap_color_code_from_img('platform/left/platform_left.png',
                                               'PLATFORM_LEFT_TILE')
    write_to_file_pixelmap_color_code_from_img('platform/mid/platform_mid.png',
                                               'PLATFORM_MID_TILE')
    write_to_file_pixelmap_color_code_from_img('platform/one_tile/platform_one_tile.png', 
                                               'PLATFORM_RIGHT_TILE')
    write_to_file_pixelmap_color_code_from_img('platform/right/platform_right.png',
                                               'PLATFORM_ONE_TILE')
    write_to_file_pixelmap_color_code_from_img('background/background_0.png',
                                               'BACKGROUND_TILE')
    write_to_file_pixelmap_color_code_from_img('background/background_1.png',
                                               'BACKGROUND_TILE')
    write_to_file_pixelmap_color_code_from_img('background/background_2.png',
                                               'BACKGROUND_TILE')
    write_to_file_pixelmap_color_code_from_img('background/background_3.png',
                                               'BACKGROUND_TILE')
    write_to_file_pixelmap_color_code_from_img('background/background_4.png',
                                               'BACKGROUND_TILE')
    write_to_file_pixelmap_color_code_from_img('background/background_5.png',
                                               'BACKGROUND_TILE')
    write_to_file_pixelmap_color_code_from_img('background/background_6.png',
                                               'BACKGROUND_TILE')
    write_to_file_pixelmap_color_code_from_img('background/background_7.png',
                                               'BACKGROUND_TILE')
    write_to_file_pixelmap_color_code_from_img('background/background_8.png',
                                               'BACKGROUND_TILE')
    write_to_file_pixelmap_color_code_from_img('background/background_9.png',
                                               'BACKGROUND_TILE')
    if not file.closed:
        file.close()
    
if __name__ == '__main__':
    main()
