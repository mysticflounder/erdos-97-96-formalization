# Production thirteen-point seven-row cut admission

Compatibility class: **C**. This is not the predecessor's nine-role relaxed
motif. It uses all thirteen pairwise-distinct labels and all four members of
each of the seven rows from
`Erdos9796Proof.P97.Census554.ThirteenPointSevenCircleCollision`.

The exact rows are:

```text
1 -> {0,3,6,8}       2 -> {3,0,7,10}
3 -> {6,1,5,8}       4 -> {10,2,6,7}
5 -> {9,3,10,8}      7 -> {11,1,3,9}
8 -> {12,2,3,7}
```

License: production theorem
`not_realizes_thirteenPointSevenCirclePattern`, with generic adapter theorem
`not_realizes_of_thirteenPointSevenCircleCollisionCore`, in
`lean/Erdos9796Proof/P97/Census554/ThirteenPointSevenCircleCollision.lean`.
The source file contains the `#print axioms` audit commands and no textual
`sorry` or custom `axiom` declaration.

Antecedent for one lazy instance: thirteen materialized carrier-point values
are pairwise distinct; each center label is an actual named blocker center;
and its named actual selected support is exactly the four mapped target
values. Exact four-slot semantics turns the four positive memberships into
row equality. Schema arms: `retained`, `common`, and `common_sameblocker`.

Admission status: **theorem-backed semantic cut**, not a relaxation. A detector
readback must independently authenticate all thirteen values and seven exact
rows before its no-good can enter the formula. `validate_clauses.py` separately
checks every record and has positive/corrupted-row controls. Global admission
cap: 12. The defective wave admitted zero no-goods before its solver
disagreement was detected.
