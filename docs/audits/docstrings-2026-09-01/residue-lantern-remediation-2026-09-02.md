# Residue Lantern docstring remediation checkpoint

This note records the source-only remediation of the confirmed findings in the
2026-09-01 Residue Lantern audit. The audit remains the frozen historical
snapshot; this file records the follow-up state after the edits.

## Confirmed findings addressed

- D001–D005: corrected the `baseAssign`, candidate-mask, nogood-bank,
  pentagonal-antiprism, and circle-power-center descriptions in the Census554
  sources.
- D006: marked the B1 global-gap theorem as a conditional adapter and exposed
  that its physical-class-five/six consumer remains open.
- D007–D010: replaced kernel-checked wording for the native replay theorems
  with the explicit `Lean.ofReduceBool` / `Lean.trustCompiler` trust boundary.
- M001–M004: repaired the malformed declaration-doc openers in `B1Live` and
  `TwoDeletionCollision`.
- M006: moved the generated-table regression description onto its theorem and
  labeled it as native-decision evidence with the same trust boundary.

No theorem statements, proof terms, imports, or executable definitions were
changed. Review-only findings (R001–R006 and the remaining malformed-opener
items) are intentionally deferred because they require separate semantic
review or declaration renaming.

## Validation

The focused Census554 build completed for the five corrected modules. A grouped
build was then started for `B1Live`, `TwoDeletionCollision`, and the three
native-replay modules. It reached 11,199 of 11,225 jobs without an error, but
was intentionally stopped because it was a broad transitive rebuild; direct
`lake env lean` checks for all five remaining modules passed.
