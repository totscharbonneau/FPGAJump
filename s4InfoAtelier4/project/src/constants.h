#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <string>
#include <map>

const int TILE_SIZE = 16;
const int MAX_TILE_IN_BACKGROUND = 256;

enum tile_type 
{
    WRONG_TILE              = -1,
    PLAYER_TILE             = 0,
    PLATFORM_LEFT_TILE      = 1,
    PLATFORM_MID_TILE       = 2,
    PLATFORM_RIGHT_TILE     = 3,
    PLATFORM_ONE_TILE       = 4,
    BACKGROUND_TILE         = 5
};

const std::map<std::string, tile_type> tile_type_name_map 
{
    {"player", PLAYER_TILE},
    {"platform_left", PLATFORM_LEFT_TILE},
    {"platform_mid", PLATFORM_MID_TILE},
    {"platform_right", PLATFORM_RIGHT_TILE},
    {"platform_one_tile", PLATFORM_ONE_TILE},
    {"background", BACKGROUND_TILE}
};

#endif // CONSTANTS_H