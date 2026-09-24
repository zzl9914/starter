CXX ?= g++
CXXFLAGS ?= -std=c++17 -Wall -Wextra -Werror -Iinclude
BUILD ?= build

.PHONY: all test clean

all: $(BUILD)/starter

test: $(BUILD)/test_starter
	./$(BUILD)/test_starter

clean:
	rm -rf $(BUILD)

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/starter: src/starter.cpp src/main.cpp include/starter.hpp | $(BUILD)
	$(CXX) $(CXXFLAGS) src/starter.cpp src/main.cpp -o $@

$(BUILD)/test_starter: src/starter.cpp tests/test_starter.cpp include/starter.hpp | $(BUILD)
	$(CXX) $(CXXFLAGS) src/starter.cpp tests/test_starter.cpp -o $@
