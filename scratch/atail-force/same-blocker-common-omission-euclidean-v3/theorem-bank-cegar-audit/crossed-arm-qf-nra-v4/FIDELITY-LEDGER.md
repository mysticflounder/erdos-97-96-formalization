# Crossed-arm v4 QF_NRA fidelity ledger

The default input is the final universal-cut-import witness at
`crossed-arm-audit/source-at-common-full-metric-bank-v4-cross-omissions-import-v3/witness.json`.
This lane consumes a `witness.json` only when its sibling `result.json` has
schema `n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v4`, status
`SAT`, and the crossed-complementary-omission and theorem-bank markers.  It also
requires every recorded semantic/geometric/crossed replay marker to be `PASS`
and structurally rechecks the carrier, selected rows, blockers, crossed polarity,
and every serialized radius partition.

## ENCODED at every stage

- One shared pair of real coordinates for all 17 named points.
- An orientation-preserving similarity gauge on the first two distinct points
  of the serialized cyclic order.
- All 136 pairwise point-distinctness inequalities.
- The full `radius_classes` partition at every one of the 17 centers.  For each
  center and every pair among its 16 other points, the driver adds an equality
  exactly when the two points occupy the same serialized class and a
  disequality otherwise.  This is 2,040 radius-relation atoms, not a selected-row
  subset.
- The `a1` partition is used verbatim.  In the current v4 witness it has seven
  classes; `rows[a1]` is one of those seven.  The driver does **not** assume or
  manufacture a fourth disjoint class from packet data.

## Stages

| Stage | Additional encoding | Status of cyclic-order fidelity |
|---|---|---|
| `metric` | none | OMITTED |
| `adjacent-turns` | 17 positive cyclic adjacent turns | relaxation only; global convex order OMITTED |
| `supporting-edges` | every other point strictly left of every directed boundary edge (255 atoms) | exact strict-convex CCW order |
| `all-triples` | every increasing triple in the serialized order has positive orientation (680 atoms) | exact strict-convex CCW order |

On SAT, every encoded atom is evaluated in the exact Z3 model.  The driver then
independently checks all 2,040 center/target-pair equality decisions against the
serialized `radius_classes` before reporting replay `PASS`.

## OMITTED in every stage

- MEC and nonobtuse-apex hypotheses.
- `CounterexampleData.noM44` and the arbitrary-`n` reduction.
- Re-execution of the source Boolean CEGAR and theorem-bank search.  Its JSON
  replay markers are validated as provenance but remain external artifact
  evidence.
- Lean proof terms, transitive axiom audit, and kernel verification.

## Trust boundary

This is an external QF_NRA diagnostic, not Lean closure.  Z3 is trusted.  A SAT
answer is only a candidate until the exact atom and full-radius replay passes.
Z3 provides no independently checkable QF_NRA UNSAT certificate here, so UNSAT
would remain an uncertified external computation.  `UNKNOWN` or timeout is no
evidence in either direction.  The `--self-check` and `--smoke` actions do not
invoke the 17-point target solver; target solving requires explicit `--solve`.

## Common-bisector core replay

`--replay-common-bisector-cores` is a source-artifact matcher, not an UNSAT-core
solver.  It scans the serialized radius partitions for two distinct centers
equidistant from the same two endpoints and checks whether the two centers have
the same executable `SurplusCOMPGBank.btw` value in the serialized cyclic cut.
Each result records the two original named `radius_eq_*` atoms, all four point
roles, cut indices, and the exact `Problem97.SurplusCOMPGBank.btw_sep` argument
mapping.  The mode never invokes the 17-point target solver.

The two metric equalities alone are **not** QF_NRA-UNSAT: their contradiction
also needs the ambient strict-convex CCW enumeration and injectivity hypotheses
of `btw_sep`.  Thus this replay gives an actionable universal four-point Lean
pattern, but it must not be reported as a two-atom explanation of a metric-only
Z3 UNSAT result.  It neither extracts a Z3 tracked core nor supplies an
independent UNSAT certificate.
