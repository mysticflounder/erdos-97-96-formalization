# Fin4 cap/omission enumeration

Model vertices as `Fin 4`, labels as `Fin 3`, and `R i j` as a directed
omission relation.  Constraints are `¬ R i i` and at least two omitted
distinct vertices in every row.  There are `4^4 = 256` legal relations and
`3^4 = 81` labelings, hence `20,736` cases.

For a repeated-label pair `i < j`, write

* `A(i,j) := R i j ∧ R j i` (mutual omission);
* `B(i,j) := R i j ∨ R j i` (at least one directed omission).

## Exact totals

| cap multiplicities | A=0,B=0 | A=0,B=1 | A=1 (necessarily B=1) |
|---|---:|---:|---:|
| `(2,1,1)` (36 labelings) | 576 | 3456 | 5184 |
| `(2,2)` (18 labelings) | 18 | 864 | 3726 |
| `(3,1)` (24 labelings) | 0 | 192 | 5952 |
| `(4)` (3 labelings) | 0 | 0 | 768 |
| **total** | **594** | **4512** | **15630** |

Thus the exact unavoidable disjunction is `A ∨ B ∨ C`, where `C` is the
complementary no-same-label-edge pattern (`¬A ∧ ¬B`).  In `C`, cap
multiplicity is necessarily `(2,1,1)` or `(2,2)` and every repeated-label pair
has zero directed omission.  There is no stronger claim that `B` is always
true: 594 counterexamples exist.

Per fixed labeling, the legal-relation counts are:

* `(2,1,1)`: `A=0,B=0` 16, `A=0,B=1` 96, `A=1` 144;
* `(2,2)`: 1, 48, 207;
* `(3,1)`: 0, 8, 248;
* `(4)`: 0, 0, 256.

## Forced 3+1 complementary pattern

When labels have multiplicities `(3,1)` and `A` is false, the three equal-
label vertices have exactly one directed omission on each pair, forming a
directed 3-cycle.  Each of the three also omits the singleton (to reach
outdegree two); the singleton omits any 2 or 3 of the triple.  This gives
`2 · 4 = 8` relations per fixed `(3,1)` labeling, hence 192 globally.

## Canonical counterexamples

* `C`, `(2,1,1)`: labels `(0,0,1,2)` and rows
  `R0={2,3}, R1={2,3}, R2={1,3}, R3={1,2}`.  The only repeated pair
  `(0,1)` has no directed edge.
* `C`, `(2,2)`: labels `(0,0,1,1)` and rows
  `R0=R1={2,3}, R2=R3={0,1}`.  Neither repeated pair has an edge.
* `A=0,B=1`, `(2,1,1)`: labels `(0,0,1,2)` and rows
  `R0={2,3}, R1={0,3}, R2={1,3}, R3={1,2}`; pair `(0,1)` has exactly the
  one edge `R1,0`.

## Lean/native_decide shape

Use a Boolean relation and finite cardinality:

```lean
def Legal (cap : Fin 4 → Fin 3) (r : Fin 4 → Fin 4 → Bool) : Prop :=
  (∀ i, !r i i) ∧
  (∀ i, 2 ≤ (Finset.univ.filter (fun j : Fin 4 => j ≠ i ∧ r i j)).card)

def A (cap : Fin 4 → Fin 3) (r : Fin 4 → Fin 4 → Bool) : Prop :=
  ∃ i j, i ≠ j ∧ cap i = cap j ∧ r i j ∧ r j i

def B (cap : Fin 4 → Fin 3) (r : Fin 4 → Fin 4 → Bool) : Prop :=
  ∃ i j, i ≠ j ∧ cap i = cap j ∧ (r i j ∨ r j i)
```

The finite theorem suitable for `native_decide` is

```lean
theorem fin4_cap_omission_classification :
  ∀ cap : Fin 4 → Fin 3, ∀ r : Fin 4 → Fin 4 → Bool,
    Legal cap r → A cap r ∨ B cap r ∨ (¬ A cap r ∧ ¬ B cap r) := by
  native_decide
```

This last disjunction is logically tautological once `A`/`B` are defined, so
for a substantive kernel test replace its third arm by an explicit `C`:
`(¬ ∃ i j k, i ≠ j ∧ i ≠ k ∧ j ≠ k ∧ cap i = cap j ∧ cap i = cap k) ∧
 (∀ i j, i ≠ j → cap i = cap j → ¬ r i j ∧ ¬ r j i)`.
Then `native_decide` checks the genuine finite classification: if neither A nor
B occurs, labels have no triple and every repeated pair has zero directed
omission (hence only `(2,1,1)` or `(2,2)`).
