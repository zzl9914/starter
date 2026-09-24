#include "starter.hpp"

#include <iostream>
#include <string>

namespace {

int failures = 0;

void expect(bool ok, const char *message) {
    if (!ok) {
        std::cerr << "FAIL " << message << "\n";
        failures++;
    }
}

}  // namespace

int main() {
    expect(starter::add(2, 3) == 5, "add");
    expect(starter::add(-1, 1) == 0, "add neg");
    expect(std::string(starter::project_name()) == "starter", "name");
    expect(starter::greet("Ada") == "Hello, Ada", "greet");
    expect(starter::greet("  Ada  ") == "Hello, Ada", "trim");
    expect(starter::greet("") == "Hello, world", "empty");
    expect(starter::greet("   ") == "Hello, world", "blank");

    if (failures != 0) {
        return 1;
    }

    std::cout << "cpp ok\n";
    return 0;
}
