#ifndef TILE_SHEET_H
#define TILE_SHEET_H

#include <map>
#include "../../constants.h"
#include "../tile_info.h"

/*
 * This class will bust the stack. It is meant to be in the heap
 */
class tile_sheet
{
private:
    std::map<tile_type, tile_info*> all_element_tiles;
    tile_info* all_background_tiles[MAX_TILE_SIZE_BACKGROUND][MAX_TILE_SIZE_BACKGROUND];

public:
    tile_sheet();
    ~tile_sheet();

    void import_tiles();
    tile_info* get_tile_info(tile_type type, int x = 0, int y = 0);
};

#endif // TILE_SHEET_H
