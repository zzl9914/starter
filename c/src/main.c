#include "starter.h"

#include <stdio.h>

int main(void) {
    char buf[128];

    if (starter_greet("Ada", buf, sizeof buf) != 0) {
        fprintf(stderr, "greet failed\n");
        return 1;
    }

    printf("%s (%s)\n", buf, starter_project_name());
    return 0;
}
