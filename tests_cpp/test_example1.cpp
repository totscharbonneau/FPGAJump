#include <gtest/gtest.h>

TEST(ExampleTestSuite1, Test1)
{
  // Expect two strings not to be equal.
  EXPECT_STRNE("hello", "world");
  // Expect equality.
  EXPECT_EQ(7 * 6, 42);
}

TEST(ExampleTestSuite1, Test2)
{
  // Expect two strings not to be equal.
  EXPECT_STRNE("hello", "world");
}