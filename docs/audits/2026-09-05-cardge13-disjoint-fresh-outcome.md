# CardGe13 disjoint-fresh outcome

Lane: `cardge13-disjoint-fresh-outcome-20260905`

Status: **UNVERIFIED**.  No Lean, LSP, or build command was run for this
lane.  The concurrent package-1 build was left untouched; its target graph
does not include this dispatcher.

## Scoped change

`CardGeThirteenOutcome.uncovered` now retains all three pairwise row
disjointness proofs and `hcard14 : 14 ≤ D.A.card`.  The producer theorem now
tests the three disjointness propositions first, emits `rowOverlap` on the
first failed proposition, and calls the compact two-arm fresh/exact theorem
only in the all-disjoint branch.

The fresh branch proves the cardinal bound by inserting `z` into the three
disjoint four-point rows, then inserting the fresh `q`, and applying
`Finset.card_le_card` to the resulting fourteen-point subset of `D.A`.  The
exact-thirteen branch preserves the existing ingress construction and exact
cover fields.

## Static evidence

- `git diff --check`: passed.
- Marker scan of the owned dispatcher: no `sorry`, `admit`, or
  `native_decide`; the pre-existing `#print axioms` directive remains.
- Dispatcher SHA-256:
  `53c527700b229e1cc1b7b9af6bf88d42b27484633c2c8bc1e824c982b7f6a473`.
- Source/build validation: not run by assignment; theorem remains
  **UNVERIFIED** until a governed Lean validation slot is available.

