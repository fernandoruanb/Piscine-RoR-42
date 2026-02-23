
## Quick Review (Ruby) — What This Code Does and What It Teaches

### 1) Data Structure Goal
The script starts with an **array of pairs** (`data`), where each inner array contains:

- a `name` (String)
- an `age` (Integer)

The goal is to **group names by age** and then **print the result sorted**:
1) by age (ascending),
2) and when ages match, by name (alphabetical).

---

### 2) Creating the Hash Safely (Avoiding `nil`)
```ruby
myHash = Hash.new { |h, k| h[k] = [] }
````

This is a **Hash with a default block**. It teaches a key Ruby pattern:

* `h` is the hash itself.
* `k` is the missing key being accessed.

When the code later does:

```ruby
myHash[age] << name
```

Ruby guarantees that `myHash[age]` is **an Array**, because the default block creates and stores `[]` the first time an unknown key appears.
This prevents the common error of trying to append to `nil`.

It also avoids the classic trap:

```ruby
bad = Hash.new([])
```

which would reuse the **same array for every key**, causing unexpected shared data.

---

### 3) Grouping Values

```ruby
data.each do |name, age|
  myHash[age] << name.strip
end
```

This demonstrates:

* **block destructuring** (`|name, age|`)
* **grouping by key** (`age`)
* using `<<` to **append** into the array
* `strip` to remove accidental spaces/newlines

---

### 4) Sorting and Printing

```ruby
myHash.keys.sort.each do |age|
  myHash[age].sort.each do |name|
    puts "#{age} : #{name}"
  end
end
```

This teaches a clean two-level ordering strategy:

* `myHash.keys.sort` sorts ages numerically (outer order).
* `myHash[age].sort` sorts names alphabetically inside each age group.

So the output respects: **age first, name as tie-breaker**.

---

### 5) About `clear` and `nil` (Memory vs Logic)

```ruby
myHash.clear
myHash = nil
```

This part teaches an important distinction:

* `clear` is a **logical cleanup** (reset the structure to empty).
* `myHash = nil` just removes the reference from that variable.

Ruby uses a **Garbage Collector**, so manual memory freeing (`free`) is not needed.
Also, setting to `nil` does not “force GC”; it only makes the object eligible for collection if no other references exist.

---

### Takeaways

* Use `Hash.new { |h, k| h[k] = [] }` to group multiple values per key safely.
* Avoid `Hash.new([])` because it creates a shared default array.
* Sort in two steps: keys for primary order, values for tie-breaks.
* Ruby manages memory automatically; `clear` is about structure/state, not manual deallocation.
