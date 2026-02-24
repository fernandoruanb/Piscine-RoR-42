## Quick review (3rd person) — what the script does

This Ruby script reads a `periodic_table.txt` file, parses each line as one chemical element plus its attributes, and generates an HTML file (`periodic_table.html`) containing a small HTML `<table>` block per element.

High-level flow:

1. **Reads the whole file** with `File.open(...).read`.
2. **Iterates line by line** using `each_line`.
3. For each line:

   * Splits the line into `element` and `chars` at the first `=` (using `split("=", 2)`).
   * Splits the attribute list by commas, then each `key:value` pair by `:` (also with `split(..., 2)`).
   * Stores parsed attributes in a Hash (`properties`).
   * Builds an HTML snippet with a **heredoc** and **string interpolation**.
   * Appends the snippet to a growing `input` string.
4. Wraps everything in a full HTML page template (another heredoc).
5. **Writes the output** to `periodic_table.html`.

---

## Key Ruby concepts demonstrated

* **Shebang + verbosity**

  * `#!/usr/bin/env ruby` allows running the file as an executable script.
  * `$VERBOSE = true` enables extra Ruby warnings, helpful during development.

* **Blocks for resource safety**

  * `File.open(...) do |f| ... end` uses a block so the file is closed automatically.

* **String parsing**

  * `split("=", 2)` ensures only the first `=` is used, keeping the rest intact.
  * `strip` removes whitespace/newlines around tokens.
  * Iteration with `each_line` and `each` builds a simple parsing pipeline.

* **Hash usage**

  * Uses a Hash to map `"number"`, `"small"`, `"molar"`, `"electron"` to values.
  * Access by key like `properties["number"]` is clear and direct.

* **Heredoc for multi-line strings**

  * `<<~HTML` is used twice:

    * once to build each element’s table snippet,
    * once to build the full HTML page.
  * `#{...}` interpolation injects Ruby variables into HTML.

* **Incremental string building**

  * `input << doc` accumulates all snippets efficiently in a single string.

---
