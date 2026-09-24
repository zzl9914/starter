var failures = 0;

void Expect(bool ok, string message)
{
    if (!ok)
    {
        Console.Error.WriteLine($"FAIL {message}");
        failures++;
    }
}

Expect(Starter.Kit.Add(2, 3) == 5, "add");
Expect(Starter.Kit.Add(-1, 1) == 0, "add neg");
Expect(Starter.Kit.ProjectName == "starter", "name");
Expect(Starter.Kit.Greet("Ada") == "Hello, Ada", "greet");
Expect(Starter.Kit.Greet("  Ada  ") == "Hello, Ada", "trim");
Expect(Starter.Kit.Greet("") == "Hello, world", "empty");
Expect(Starter.Kit.Greet("   ") == "Hello, world", "blank");
Expect(Starter.Kit.Greet(null) == "Hello, world", "null");

if (failures != 0)
{
    return 1;
}

Console.WriteLine("csharp ok");
return 0;
