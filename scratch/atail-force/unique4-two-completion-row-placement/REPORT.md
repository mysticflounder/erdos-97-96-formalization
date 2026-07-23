# Two-completion-row placement checkpoint

## Status

**CHECKED CONSUMER; SOURCE OCCURRENCE OPEN.**

The previous `ThreeRowMiddleArcPlacement` required one completion row to
contribute both the first and fourth outer arcs.  That is stronger than the
source data supplied by deletion robustness.  The aggregate curvature
terminal permits different rows at those two positions.

`UniqueFourTwoCompletionRowPlacement.lean` therefore introduces
`TwoCompletionRowMiddleArcPlacement`, with:

- one common completion center;
- independent `leftCompletionRow` and `rightCompletionRow` at that center;
- the same two fixed-image rows in the middle; and
- the same three explicit cyclic gap inequalities.

The checked map
`TwoCompletionRowMiddleArcPlacement.toFourTurnDisjointSelectedRowArcs` feeds
the existing terminal `false_of_fourTurnDisjointSelectedRowArcs`.  The older
one-row packet embeds into the new packet, so this is a strict weakening of
the producer contract.

## Exact remaining obligation

Produce `Nonempty (TwoCompletionRowMiddleArcPlacement P)` on a source-valid
robust global-deletion arm.  Radius classification can justify the independent
row choices, but does not by itself prove the three cyclic gap inequalities.
The singleton minimal-core arm remains separate.

The split robust-completion regression now confirms that merely adding two
rows at the omitted center is still insufficient in the finite abstraction.
A successful source producer must retain and use the actual five-class or
minimal-core provenance and cap-complement data; it cannot consume only the
row choices.

## Validation

The focused warnings-as-errors check succeeds.  All three declarations print
only `propext`, `Classical.choice`, and `Quot.sound`; none reaches `sorryAx`.

```bash
cd lean
LEAN_PATH=../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer:/tmp/unique4-main-validation \
lake env lean -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-two-completion-row-placement \
  ../scratch/atail-force/unique4-two-completion-row-placement/UniqueFourTwoCompletionRowPlacement.lean
```
