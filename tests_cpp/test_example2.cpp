#include <gtest/gtest.h>
#include "../s4InfoAtelier4/project/src/test_alex.h"

TEST(ExampleTestSuite2, file2_Test1)
{
    int x = 13;
    test_alex a(2);
    a.setx(x);

    EXPECT_EQ(a.getx(), x);
}

TEST(ExampleTestSuite2, file2_Test2)
{
    int x = 13;
    test_alex a(2);
    a.setx(x);

    EXPECT_EQ(a.getx(), x+1);
}