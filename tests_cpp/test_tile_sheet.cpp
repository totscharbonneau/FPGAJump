#include <gtest/gtest.h>
#include "../s4InfoAtelier4/project/src/tile/tile_sheet/tile_sheet.h"
#include "../s4InfoAtelier4/project/src/tile/tile_info.h"

TEST(TILE_SHEET_TESTS, T1)
{
    tile_sheet* uut = new tile_sheet;
    tile_info* test_info = uut->get_tile_info(PLATFORM_LEFT_TILE);

    EXPECT_EQ(test_info->tile_id, 1);
    EXPECT_EQ(test_info->pixelmap[1][1], 511);
}

TEST(TILE_SHEET_TESTS, T2)
{
    tile_sheet* uut = new tile_sheet;
    tile_info* test_info = uut->get_tile_info(BACKGROUND_TILE, 1, 0);

    EXPECT_EQ(test_info->tile_id, 6);
    EXPECT_EQ(test_info->pixelmap[2][1], 495);
}