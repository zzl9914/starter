#include "starter.h"

#include <ctype.h>
#include <string.h>

const char *starter_project_name(void) {
    return "starter";
}

int starter_add(int a, int b) {
    return a + b;
}

static int is_blank(unsigned char ch) {
    return isspace(ch) != 0;
}

int starter_greet(const char *name, char *buf, size_t buflen) {
    const char *start;
    size_t len;
    const char *who;
    size_t who_len;

    if (buf == NULL || buflen == 0) {
        return -1;
    }

    start = name == NULL ? "" : name;
    while (*start != '\0' && is_blank((unsigned char)*start)) {
        start++;
    }

    len = strlen(start);
    while (len > 0 && is_blank((unsigned char)start[len - 1])) {
        len--;
    }

    who = start;
    who_len = len;
    if (who_len == 0) {
        who = "world";
        who_len = 5;
    }

    if (buflen < who_len + 8) {
        return -1;
    }

    memcpy(buf, "Hello, ", 7);
    memcpy(buf + 7, who, who_len);
    buf[7 + who_len] = '\0';
    return 0;
}
