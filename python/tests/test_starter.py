import unittest

from starter import add, greet, project_name


class StarterTest(unittest.TestCase):
    def test_add(self) -> None:
        self.assertEqual(add(2, 3), 5)
        self.assertEqual(add(-1, 1), 0)

    def test_project_name(self) -> None:
        self.assertEqual(project_name(), "starter")

    def test_greet(self) -> None:
        self.assertEqual(greet("Ada"), "Hello, Ada")
        self.assertEqual(greet("  Ada  "), "Hello, Ada")
        self.assertEqual(greet(""), "Hello, world")
        self.assertEqual(greet("   "), "Hello, world")
        self.assertEqual(greet(None), "Hello, world")


if __name__ == "__main__":
    unittest.main()
