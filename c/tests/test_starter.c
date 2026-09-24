#include "starter.h"

#include <stdio.h>
#include <string.h>

static int failures = 0;

static void expect(int ok, const char *message) {
    if (!ok) {
        fprintf(stderr, "FAIL %s\n", message);
        failures++;
    }
}

int main(void) {
    char buf[64];

    expect(starter_add(2, 3) == 5, "add");
    expect(starter_add(-1, 1) == 0, "add neg");
    expect(strcmp(starter_project_name(), "starter") == 0, "name");

    expect(starter_greet("Ada", buf, sizeof buf) == 0, "greet rc");
    expect(strcmp(buf, "Hello, Ada") == 0, "greet");
    expect(starter_greet("  Ada  ", buf, sizeof buf) == 0, "trim rc");
    expect(strcmp(buf, "Hello, Ada") == 0, "trim");
    expect(starter_greet("   ", buf, sizeof buf) == 0, "blank rc");
    expect(strcmp(buf, "Hello, world") == 0, "blank");
    expect(starter_greet(NULL, buf, sizeof buf) == 0, "null rc");
    expect(strcmp(buf, "Hello, world") == 0, "null");
    expect(starter_greet("Ada", buf, 4) == -1, "small");
    expect(starter_greet("Ada", NULL, 16) == -1, "null buf");

    if (failures != 0) {
        return 1;
    }

    puts("c ok");
    return 0;
}
