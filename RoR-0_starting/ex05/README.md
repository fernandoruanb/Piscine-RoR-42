
## Code Review — Ruby State & Capital Detection Script

### Overview
This Ruby script solves a classic mapping problem: given a user input, determine whether it represents a **U.S. state** or a **state capital**, and then print the corresponding information (capital, state name, and abbreviation). The solution mirrors a similar challenge from the Python Django Piscine, but is implemented in **pure Ruby**, emphasizing explicit control flow and clear data handling.

---

### Structure & Design
The code is well structured around **two core functions**, each with a single responsibility:

- `isCapital`:  
  Determines whether the input matches a capital city. If so, it resolves the corresponding state and abbreviation.

- `isState`:  
  Determines whether the input matches a state name and retrieves its capital and abbreviation.

Both functions:
- Perform **case-insensitive comparisons** using `downcase`
- Return `nil` when no match is found, aligning with Ruby’s idiomatic handling of “no result”
- Return a consistent array structure:  
  `[capital, state, sigla]`

This design choice simplifies downstream logic and avoids unnecessary condition complexity.

---

### Argument Handling
- The script enforces exactly **one command-line argument** (`ARGV.length != 1`)
- The argument can contain **multiple comma-separated values**, which are:
  - Split
  - Stripped of whitespace
  - Processed independently

This allows flexible input such as:
```

ruby script.rb "Oregon, Salem, New Jersey"

````

---

### Control Flow & Output Logic
The main loop cleanly handles three scenarios:
1. Input is a **capital**
2. Input is a **state**
3. Input matches neither (prints nothing)

The use of:
```ruby
if isValidState.nil? && !isValidCapital.nil?
elsif isValidCapital.nil? && !isValidState.nil?
````

ensures **mutual exclusivity** and avoids ambiguous output.

---

### Key Learnings Demonstrated

* Proper iteration over hashes using `for key, value in hash`
* Case-insensitive string comparison in Ruby
* Safe and explicit `nil` handling
* Clean separation of logic into small, testable functions
* Practical usage of `ARGV` for command-line tools
* Returning structured data (arrays) instead of printing inside functions

---

### Conclusion

This script demonstrates a solid understanding of Ruby fundamentals, especially in:

* Data structure traversal
* Input normalization
* Control flow
* Functional decomposition

It is a clean, readable, and correct solution that effectively translates a Python-style exercise into idiomatic Ruby logic while preserving clarity and correctness.