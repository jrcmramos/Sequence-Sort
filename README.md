# Description

Sorts `Sequences` based on single/multiple keypaths, based on the order.

# Usage 

```Swift
struct Animal {
    let name: String
    let breed: String
}

let animals: [Animal] = [
    .init(name: "Alex", breed: "Poodle"),
    .init(name: "Jack", breed: "Beagle"),
    .init(name: "Rocky", breed: "Rottweiler"),
    .init(name: "Tucker", breed: "Poodle"),
    .init(name: "Spike", breed: "Beagle"),
    .init(name: "Ace", breed: "Poodle"),
]

animals.sorted(by: [\Animal.name, \Animal.breed], order: .ascending)

// OUTPUT
▿ 6 elements
  ▿ __lldb_expr_124.Animal
    - name: "Ace"
    - breed: "Poodle"
  ▿ __lldb_expr_124.Animal
    - name: "Alex"
    - breed: "Poodle"
  ▿ __lldb_expr_124.Animal
    - name: "Jack"
    - breed: "Beagle"
  ▿ __lldb_expr_124.Animal
    - name: "Rocky"
    - breed: "Rottweiler"
  ▿ __lldb_expr_124.Animal
    - name: "Spike"
    - breed: "Beagle"
  ▿ __lldb_expr_124.Animal
    - name: "Tucker"
    - breed: "Poodle"

```