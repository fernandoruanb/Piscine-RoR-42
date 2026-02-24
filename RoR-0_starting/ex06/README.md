## Quick review

This Ruby script groups people by **age**, then prints all **names in alphabetical order**, with ages processed in **ascending order**.

### What the code does

* It defines `data` as an array of `[name, age]` pairs.
* It builds `myHash` where:

  * **key** = `age`
  * **value** = an array of names with that age
    It uses a default block so missing keys auto-initialize to `[]`:

  ```ruby
  myHash = Hash.new { |h, v| h[v] = [] }
  ```
* It iterates through `data` and pushes each name into the correct age bucket:

  * `myHash[age] << name`
* It prints the final result by:

  * sorting the ages: `myHash.keys.sort`
  * sorting the names inside each age: `myHash[age].sort`
  * printing each name on its own line

### What was learned

* **Hash with default value via block**: how to create a hash that automatically creates an empty array for new keys, avoiding `nil` checks.
* **Grouping pattern**: the classic “bucket” technique (`hash[key] << value`) to group data by a property (here, age).
* **Deterministic output with sorting**:

  * sorting hash keys to control output order
  * sorting grouped values to get consistent alphabetical results
* **Nested iteration**: iterating first over sorted keys, then over sorted values.