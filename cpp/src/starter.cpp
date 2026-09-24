#include "starter.hpp"

namespace starter {

const char *project_name() {
    return "starter";
}

int add(int a, int b) {
    return a + b;
}

std::string greet(const std::string &name) {
    const auto begin = name.find_first_not_of(" \t\n\r\f\v");
    if (begin == std::string::npos) {
        return "Hello, world";
    }
    const auto end = name.find_last_not_of(" \t\n\r\f\v");
    return "Hello, " + name.substr(begin, end - begin + 1);
}

}  // namespace starter
