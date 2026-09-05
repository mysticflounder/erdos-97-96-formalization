# B1 cross-blocker fiber bridge

Lane: `b1-crossblocker-fiber-bridge-20260905`
Owner: `luna-swarm-lemma-lantern`
Source: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CrossBlockerFiberBridge.lean`

## Result

The source-clean bridge proves the two outside-fiber residual landings:

- `freshOutsideFirst_actualBlockerFiber_card_three_or_four` gives
  `|actualBlockerFiber H ⟨P.source₁, P.source₁_mem_A⟩| = 3 ∨ 4` from
  `FreshOutsideFirstBlockerFiber P Pρ`.
- `freshOutsideSecond_actualBlockerFiber_card_three_or_four` gives the
  symmetric `= 3 ∨ 4` landing at `Pρ.source₁`.

For the first arm, the two retained collision sources and the fresh outside
source are distinct members of the same actual-blocker fiber.  Thus its card
is at least three.  `ATailSurvivalCover.actualBlockerFiber_card_le_four`
supplies the global upper bound, and `omega` closes the finite disjunction.
The second arm is the same argument after exchanging the two collision rows.

## Source-mining boundary

The existing target-side theorem
`actualBlockerFiber_filter_capByIndex_card_le_two` can bound the portion of
an actual fiber lying in a cap once its blocker center is known to lie in that
cap.  It does not eliminate either `3` or `4` here: the outside-fiber witness
is explicitly outside the first cap, while the retained pair accounts for the
cap-local portion.  The generic four-point bound likewise permits both
cardinalities.

`CrossBlockerCoincidence` is intentionally not treated as a contradiction in
this module.  It is a disjunction of equalities between blocker centers and
does not by itself provide the missing endpoint cross-membership, order, K4
deletion, or no-`M44` exclusion needed by the downstream terminals.

The first missing source-clean consumer is therefore a theorem that combines
one of these outside-fiber landings with the retained minimality/no-`M44`,
tri-apex, and deletion-cycle data to rule out the `3` and `4` cases (or to
produce a named K4/deletion contradiction).  No such bridge was found in the
checked source corpus; this lane does not claim closure of
`false_of_crossBlockerCoincidence`.

## Validation

From the Lake root:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CrossBlockerFiberBridge.lean
```

This focused check completed successfully on the lane working tree.
