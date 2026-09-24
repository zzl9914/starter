package starter;

public final class StarterTest {
    private StarterTest() {
    }

    public static void main(String[] args) {
        int failures = 0;
        failures += expect(Starter.add(2, 3) == 5, "add");
        failures += expect(Starter.add(-1, 1) == 0, "add neg");
        failures += expect("starter".equals(Starter.projectName()), "name");
        failures += expect("Hello, Ada".equals(Starter.greet("Ada")), "greet");
        failures += expect("Hello, Ada".equals(Starter.greet("  Ada  ")), "trim");
        failures += expect("Hello, world".equals(Starter.greet("")), "empty");
        failures += expect("Hello, world".equals(Starter.greet("   ")), "blank");
        failures += expect("Hello, world".equals(Starter.greet(null)), "null");
        if (failures > 0) {
            System.exit(1);
        }
        System.out.println("java ok");
    }

    private static int expect(boolean ok, String message) {
        if (!ok) {
            System.err.println("FAIL " + message);
            return 1;
        }
        return 0;
    }
}
