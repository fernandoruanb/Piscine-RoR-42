## Quick Review (Ruby) — Reverse Lookup: Capital → State

This script performs the inverse operation of the previous one: it receives a **capital city** via the command line and prints the **corresponding state name**.

### How It Works

- The script defines two hashes:
  - `states`: maps **State Name → Abbreviation**
  - `capitals_cities`: maps **Abbreviation → Capital City**
- The user provides exactly **one argument** (`ARGV[0]`), which is treated as the capital city input (with `strip` to remove extra whitespace).

### Core Logic (Two-Step Reverse Lookup)

Because the hashes are not built in the direction “capital → state”, the code does this in two steps:

1) **Find the abbreviation (sigla) from a capital name**
```ruby
sigla = getCapitalSigla(capitals_cities, capitalInput)
````

`getCapitalSigla` iterates through `capitals_cities` and compares each `capital` to the user input. If it matches, it returns the abbreviation key.

2. **Find the state name from the abbreviation**

```ruby
getStateBySigla(states, sigla)
```

`getStateBySigla` iterates through `states` and returns the state name whose value matches the abbreviation.

### Error Handling

* If the user does not pass exactly one argument, the script exits with status `1`.
* If the capital city is not found, the script prints:

  * `Unknown capital city`
    and exits cleanly with status `0`.

### Concepts Reinforced

* **Command-line input** using `ARGV[0]`.
* **Iteration over hashes** (`for key, value in hash`).
* **Manual reverse lookup**: searching values to find the associated key.
* **Nil as “not found”**: methods return `nil` when no match exists, enabling safe checks.

Overall, the code is clear and correctly demonstrates how to invert a mapping when the data structure is not already arranged in the desired direction.
