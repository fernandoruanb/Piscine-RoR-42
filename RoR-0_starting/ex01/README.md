
## Quick Review (Ruby) — Functionality and Lessons

This script shows a clean Ruby pattern for **reading a file safely**, **splitting text**, and **iterating over the results**.

### How it Works

- The **shebang** (`#!/usr/bin/env ruby`) allows the file to be executed directly as a Ruby script.
- `$VERBOSE = true` enables Ruby warnings, which helps catch suspicious code patterns early.
- `File.open("numbers.txt", "r") do |mySexyFile| ... end` opens the file in **read mode** and guarantees it will be **closed automatically** after the block finishes (Ruby’s equivalent to Python’s `with`).
- `mySexyFile.read` loads the **entire file content** into a string (`myNumbers`).
- `myNumbers.split(",")` breaks that string into an array using `,` as the delimiter.
- `.each do |beautifulNumber| ... end` iterates over each extracted piece and prints it with `puts`.

### What This Teaches

- **Safe resource handling:** Using `File.open` with a block ensures the file is always closed.
- **Text parsing:** `split(",")` is the standard way to tokenize comma-separated values.
- **Iteration with blocks:** `each` yields one element at a time to a named block variable.
