# B1 card-six projected target ingress

Lane: `luna-swarm-proofforge-b1-card6-projected-target-20260904`  
Owner: `luna-swarm-proofforge`  
Base head: `0a20e8cdde4da113efcddcba1f6095c2fc13e57d`

## Scope

The lane owns the projected target adapter, its audit, its checkpoint, and
the declared run receipts. The adapter imports
`B1CardSixProjectedPointConfiguration` and `B1CardSixRawOrderIngress` only.
It does not edit either dependency, `TwoDeletionCollision`, or assert PIQD
closure or order-cell coverage.

The target source is 103 lines with SHA-256
`1dde581a6c99953b2de537f40d1fdf46b4e81c45d11a43ba003803ac14947ac5`.
The dependency source was initially 603 lines with SHA-256
`1314a71ddc3e1e7f46a7f0add6d4bfcd673b0945069907f322b54f617ea244cf`.
The owner has since repaired it; the current source is SHA-256
`1c72e862eae6a72505e1d90b88fe1b080ca13c404d915a11f7c2a6608c3aeae1`.
The promoted raw-order dependency is 624 lines with SHA-256
`152fad607cec333337f82ab8617cb86713bc89328845a15cf4f5b3965acf342d`.

## Declarations

`projectedRawCardSixBad` is the two-pair `SurplusCOMPGBank.btw` predicate
specialized to `projectedLabelIndex` and projected role labels for
`physicalApex`, `Bu`, `Bv`, `u0`, `u1`, `v0`, and `v1` over an ambient boundary.
`projectedRawCardSixBad_iff_raw` expands the projected labels and index API to
`RawCardSixBad` on the ambient raw-order indices.
`false_of_b1PhysicalClassFiveSixNormalForm_of_not_projectedRawCardSixBad`
passes the transported negation to the promoted RawOrderIngress consumer.
`roleCarrier_card_ge_six` delegates the lower bound to the public theorem
from `B1CardSixProjectedPointConfiguration`.

## Validation status

- Source marker scan: target source is marker-clean.
- Governed target build receipt: exit 0, 5,880 lines, SHA-256
  `74af286883b6f048cb2095f9216dbe41b48524ceb2d3b23332badaac512ecc9f`.
  The target compiled against component SHA `1c72e862`.
- Axiom probe receipt: exit 0, 39 lines, SHA-256
  `9dc7a7ada00de8d806c6ddf4166789f0132dcf9ffae89a92dba3c948de6a3d53`.
  All four target declarations report only `propext`, `Classical.choice`, and
  `Quot.sound`; no `sorryAx` is present.
- Sparse hygiene report: this checkpoint has zero lane issues. The shared
  repository report is globally blocking only because it contains pre-existing
  foreign dirty/untracked and staged paths; those paths are outside this lane
  and were left untouched.
- Staged hygiene and promotion: pending final lane report and explicit
  promotion authorization.
- Staged hygiene and promotion: pending a green dependency and target build.

No solver, PIQD, or external-evidence result is part of this lane.
