import assert from "node:assert/strict";
import { test } from "node:test";
import { add, greet, projectName } from "./starter.js";

test("adds integers", () => {
  assert.equal(add(2, 3), 5);
  assert.equal(add(-1, 1), 0);
});

test("reports the project name", () => {
  assert.equal(projectName(), "starter");
});

test("greets with a trimmed name", () => {
  assert.equal(greet("Ada"), "Hello, Ada");
  assert.equal(greet("  Ada  "), "Hello, Ada");
  assert.equal(greet(""), "Hello, world");
  assert.equal(greet("   "), "Hello, world");
  assert.equal(greet(null), "Hello, world");
});
