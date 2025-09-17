# 📘 TypeScript Notes

---

## 🔷 What is TypeScript?

- TypeScript is a **syntactic superset** of JavaScript.
- It **adds static typing** capabilities to JavaScript.
- Adds extra syntax to catch errors **during development**.

---

## ❓ Why Should I Use TypeScript?

- 🔹 JavaScript is **loosely typed**, so:
  - Function parameters and variables lack type information.

- ✅ TypeScript enables:
  - **Type annotations** (defining expected data types).
  - **Compile-time error checking** when types don’t match.

- ⏱️ TypeScript uses **compile-time type checking**, unlike JS which checks at runtime.

---

## ⚙️ TypeScript Compiler

- TypeScript must be **transpiled** into JavaScript using a compiler.
- ✅ This ensures it runs **anywhere JavaScript runs** (e.g., browsers, Node.js).

---

## 📦 Installing the Compiler

```bash
# Install TypeScript as a dev dependency
npm install typescript --save-dev

# Check the installed TypeScript version
npx tsc

# Initialize a default tsconfig.json file
npx tsc --init
```

## ⚙️ tsconfig.json Configuration Example

{
  "include": ["src"],
  "compilerOptions": {
    "outDir": "./build"
  }
}


🗂️ This tells the TypeScript compiler to:

    Look for .ts files inside the src/ directory.

    Transpile and output them into the build/ directory as .js files.

