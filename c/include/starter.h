#ifndef STARTER_H
#define STARTER_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

const char *starter_project_name(void);

int starter_add(int a, int b);

/* Write "Hello, <name>" into buf.
   A NULL or blank name becomes "world".
   Returns 0 on success, or -1 when buf is NULL or too small. */
int starter_greet(const char *name, char *buf, size_t buflen);

#ifdef __cplusplus
}
#endif

#endif
