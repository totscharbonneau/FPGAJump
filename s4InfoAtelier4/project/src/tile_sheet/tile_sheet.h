#ifndef TILE_SHEET_H
#define TILE_SHEET_H

#include <map>
#include "../structs.h"

class tile_sheet
{
private:
    std::map<tile_type, tile_list> all_tiles;
    void clean_all_tiles();

public:
    tile_sheet();
    ~tile_sheet();

    void import_tiles();
    tile_info get_tile_info(tile_type type, int x = 0, int y = 0);
};

#endif // TILE_SHEET_H
