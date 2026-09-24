#include "starter.hpp"

#include <iostream>

int main() {
    std::cout << starter::greet("Ada") << " (" << starter::project_name() << ")\n";
    return 0;
}
