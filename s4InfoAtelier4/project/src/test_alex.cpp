#include "test_alex.h"

test_alex::test_alex(int x)
{
    this->x = x;
}

test_alex::~test_alex()
{
}

void test_alex::setx(int x)
{
    this->x = x;
}

int test_alex::getx()
{
    return x;
}