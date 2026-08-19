# FreshThird common-radius six-center producer wave

Date: 2026-08-19

## Scope

This wave starts from the authenticated common-only v7 CNF and tests the
source-clean one-sided arm of
`TwoSourceClosure.sixCenterDeletionSurvivalPacket_of_oneSided`.  It does not
encode `classAt`, `SelectedFourClass`, or a cardinality lift.  Every result is
finite diagnostic evidence only.

The v7 prefix is preserved byte-for-byte with SHA-256
`81765f225d38b8433ee7704e2f8e2c19566d78842f37eeff08ed055a2a1794cd`.

## Refinement v8: six-center deletion survival

The source-pair one-sided arm is forced.  For both deletion orientations, the
refinement adds:

- `hasFourAfterDeleting` for the five named centers
  `(Pρ-blocker, P-blocker, first apex, second apex, surplus apex)`;
- `hasFourAfterDeleting` for the surviving common-source blocker;
- pairwise distinctness of the six center indices, encoded only as
  `¬(left=i ∧ right=i)` for each common index `i`.

The corrected query has 93,342 variables and 642,714 clauses, with 3,979 new
clauses.  CaDiCaL returned `SAT` in 1.50 seconds.  The model selected
`delete_two_keep_one`, with common sources 14 and 8, common blockers 3 and 9,
and six distinct packet centers.

An earlier draft incorrectly forbade all pairs of different indices rather
than only equal indices.  That over-constrained CNF returned a DRAT-verified
`UNSAT`, but it was discarded and is not evidence.

## Refinement v9: provenance boundary

On top of corrected v8, the query adds the source-clean consequences of
`SixSurvivorExactRowsBoundary.collisionRows_sourceProvenance`:

- the row at the second-radius retained source contains both second-radius
  sources;
- the row at the first-radius retained source contains exactly the four
  points `{P₁, P₂, fresh₁, fresh₂}`;
- the deleted common source is absent from the two collision rows and the
  surviving common-source row.

The query has 93,342 variables and 648,494 clauses, with 5,780 new clauses.
CaDiCaL returned `SAT` in 1.43 seconds.  Its model selected
`delete_one_keep_two`, with deleted common source 13 and surviving common
source 12.  The relevant finite rows were:

```text
first-fiber row at P₁:       [0, 12, 14, 15]
second-radius row at Pρ₁:   [11, 12, 14, 16]
surviving common-source row: [0, 2, 12, 16]
```

The role indices were `P₁=15`, `P₂=14`, `Pρ₁=16`, `Pρ₂=11`,
`fresh₁=0`, `fresh₂=12`, and the deleted point was 13.  Thus the model
replays every v9 provenance clause and leaves the expected anonymous fillers.

## Conclusion and next target

The six-center deletion packet and its collision-row provenance are not the
missing producer: both source-faithful finite relaxations remain satisfiable.
The next exact source-produced object is
`SixSurvivorU3ExactRadiusAuditObstruction`, which adds a fixed triple, an
exact dangerous-radius class of cardinality three, and an escape-or-critical-
shell witness.  Those data are not represented by the current finite
assignment, so another generic SAT strengthening would be unsound.  The next
computational target is therefore a dedicated U3 audit ingress with explicit
finite variables for that packet, or a Lean adapter exposing its existing
source producer to a finite encoder.

No universal theorem, finite-to-universal lift, or load-bearing `sorry` was
closed by this wave.
