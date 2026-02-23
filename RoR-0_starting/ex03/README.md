
## Quick Review (Ruby) — Behavior and Key Lessons

This script demonstrates a clean and idiomatic way to **read a command-line argument**, **look up values in hashes**, and **handle missing data safely** in Ruby.

### How the Program Works

- The **shebang** (`#!/usr/bin/env ruby`) allows the script to be executed directly.
- `$VERBOSE = true` enables Ruby warnings, helping detect potential issues early.
- Two hashes are defined:
  - `states`: maps state names to their abbreviations.
  - `capitals_cities`: maps abbreviations to capital cities.
- The program enforces that **exactly one argument** is provided by the user via `ARGV`.

### Functional Design

- `getStateSigla(states, state)`  
  Returns the state abbreviation or `nil` if the state is not found.
- `getCapitalBySigla(capitals, sigla)`  
  Returns the capital city associated with the abbreviation.

Both methods rely on Ruby’s implicit return: the last evaluated expression is returned automatically. When a lookup fails, Ruby returns `nil`, which is later checked explicitly.

### Control Flow and Error Handling

- The script validates input size (`ARGV.length != 1`) before doing any work.
- If the state is unknown, it prints **`"Unknown state"`** and exits gracefully.
- If the state exists, it retrieves and prints the corresponding capital city.

### Concepts Reinforced

- **`ARGV[0]` in Ruby** represents the first user-provided argument (not the program name).
- **Hashes** return `nil` for missing keys, enabling simple existence checks.
- **Pure functions** improve clarity and reusability by avoiding direct access to `ARGV` inside methods.
- Ruby handles memory automatically via **Garbage Collection**, so no manual cleanup is required.

Overall, the code is concise, readable, and correctly applies Ruby idioms for command-line parsing and data lookup.
```
