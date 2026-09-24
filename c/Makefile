CC ?= gcc
CFLAGS ?= -std=c11 -Wall -Wextra -Werror -Iinclude
BUILD ?= build

.PHONY: all test clean

all: $(BUILD)/starter

test: $(BUILD)/test_starter
	./$(BUILD)/test_starter

clean:
	rm -rf $(BUILD)

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/starter: src/starter.c src/main.c include/starter.h | $(BUILD)
	$(CC) $(CFLAGS) src/starter.c src/main.c -o $@

$(BUILD)/test_starter: src/starter.c tests/test_starter.c include/starter.h | $(BUILD)
	$(CC) $(CFLAGS) src/starter.c tests/test_starter.c -o $@
