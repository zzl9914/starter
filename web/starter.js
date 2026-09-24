export function projectName() {
  return "starter";
}

export function add(a, b) {
  return a + b;
}

export function greet(name) {
  const trimmed = typeof name === "string" ? name.trim() : "";
  const who = trimmed.length === 0 ? "world" : trimmed;
  return `Hello, ${who}`;
}

const form = globalThis.document?.querySelector("#greet-form");
const input = globalThis.document?.querySelector("#name");
const output = globalThis.document?.querySelector("#output");

form?.addEventListener("submit", (event) => {
  event.preventDefault();
  if (output) {
    output.textContent = greet(input?.value ?? "");
  }
});
