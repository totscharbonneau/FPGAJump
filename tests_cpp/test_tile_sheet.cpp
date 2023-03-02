#include <gtest/gtest.h>
#include "../s4InfoAtelier4/project/src/tile_sheet/tile_sheet.h"

TEST(TILE_SHEET_TESTS, T1)
{
    tile_sheet uud;
    tile_info test_info = uud.get_tile_info(PLATFORM_LEFT_TILE, 1);

    EXPECT_EQ(test_info.tile_id, 1);
    // EXPECT_EQ(test_info.pixelmap[1][1], 511);
}