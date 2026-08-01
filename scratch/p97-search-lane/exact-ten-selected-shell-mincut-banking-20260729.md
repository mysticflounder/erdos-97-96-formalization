# Exact-ten selected-shell min-cut banking

## Status

`S-MINCUT` is kernel-closed at the exact-`n = 10` mathematical encoding
level in:

- `Problem97.exists_selectedFourClass_escape_of_card_eq_ten`;
- `Problem97.exists_selectedFourClass_entry_of_card_eq_ten`.

Both declarations live in
`lean/Erdos9796Proof/P97/ExactTenSelectedShellMincut.lean`.

The source is clean: it contains no `sorry`, `admit`, or declared axiom.
Direct Lean checking succeeded.  Both declarations have transitive axiom
closure

```text
[propext, Classical.choice, Quot.sound]
```

and therefore introduce no new trust boundary.

## Exact scope

Let `A` be a convex-independent finset with `A.card = 10`.  For every
`center : A`, let `rowAt center` be an arbitrary `SelectedFourClass`:
exactly four points of `A`, all at one positive distance from the center.

For every nonempty proper `X ⊆ A`, the entry theorem produces

```text
center ∈ A, center ∉ X,
x ∈ X, x ∈ (rowAt center).support.
```

This is exactly one true disjunct of the generator clause

```text
∨ p ∉ X, x ∈ X, s[p,x].
```

Thus the theorem justifies every one of the `2^10 - 2 = 1022` `S-MINCUT`
clauses, provided the `s[p,x]` variables are interpreted as membership in
the selected four-class `rowAt p`.

## Proof route

If a nonempty proper subset `B ⊂ A` had no selected edge leaving it, every
selected row centered in `B` would lie wholly in `B`.  Those rows witness
`HasNEquidistantProperty 4 B`.  Convex independence descends from `A` to
`B`, so `Problem97.counterexample_card_ge_ten` gives `10 ≤ B.card`.
Proper containment and `A.card = 10` give `B.card < 10`, a contradiction.

For the generator's incoming-edge orientation, apply the escape theorem to
`A \ X`.

## Reachability

The declarations are currently source-checked but deliberately not imported
by a production aggregator or publish target.  No aggregator was edited,
because that was outside this lane's ownership.  Consequently this is a
kernel-closed theorem bank entry, not yet an end-to-end encoder/publish
reachability claim.
