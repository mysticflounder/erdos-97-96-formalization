# Rigid221 S0 B3 ingress compatibility audit

**Date:** 2026-08-31
**Lane:** rigid221-s0-b3-ingress-compatibility-20260831
**Base:** dcfc4b63ba31b0769f45d81f87aedf740357d491
**Status:** negative compatibility result; no new Lean declaration

## Question

Can the source-row-heavy literal-blocker-`v` B3 context feed the verified
twelve-hypothesis normalized five-point contradiction through an existing
source ingress?

The intended eventual consumer is
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`
in `Rigid221Placement.lean:903`.

## Candidate and direct interface comparison

The bounded geometry result
`Erdos9796Proof.Geometry.normalizedFivePoint_orientation_incompatibility`
in `Geometry/NormalizedFivePointOrientation.lean:45` takes fixed normalized
coordinates, two radius facts, one disk fact, two boundary facts, two strict
orientation facts, and a cap-product inequality.  Its only current caller is
the bounded adapter `ExactTwelveRigid221Ingress.false_of_fixedCellNormalization`
in `ExactTwelveRigid221FixedCellNormalization.lean:32`.

The B3 context supplies `P`, literal source-blocker equality, source-row
heaviness, and the derived membership of `v` in the second-cap interior.  It
does not name a normalization base pair, Moser points, a source `delta`, the
three fixed normalized coordinate facts, or the required signed-area product.
No present theorem produces this full interface from B3.

## Existing normalized ingress is incompatible

The closest source dispatcher,
`exists_source_normalized_v14_physicalCycle_namedArm_distinguishedD` in
`ExactTwelveRigid221NormalizedV14Ingress.lean:38`, requires
`ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P`.  That packet
is constructed in `Rigid221SourceHeavy.lean:113` from a blocker that lies in
the `v` row and is distinct from `v`.  B3 instead fixes the actual source
blocker to `P.v.1`.

The normalized ingress modules are downstream of `Rigid221Placement` through
the source-heavy layer.  Importing them into `Rigid221Placement` would form an
import cycle.  The fixed-cell normalization module has no such cycle, but it
still lacks a source producer for its hypotheses.

## Related C3 result

`Rigid221SourceRowCapBetweenness.lean:525` proves that B3's source facts yield
either `P.other.1 = P.v.1` or a second-cap cardinality of at least six.  The
`other = v` arm is source-consistent and introduces no second C3,
order, or incidence relation.  This dispatch does not feed the normalized
geometry result and has no downstream B3 consumer.

## Consequence

Do not add another hypothesis-only adapter.  The first viable Lean statement
must be an upstream, source-faithful producer for the literal-blocker-`v`
branch: either a construction of a new geometric relation that B3 can consume,
or a source normalization theorem with a complete twelve-hypothesis map.
The initial task is to identify the missing source assertion or relation, not
to assert it as a new `sorry`-backed wrapper.

The proof-blueprint graph was stale during this audit because unrelated Lean
changes were present in the shared worktree.  The source and import checks
above are read-only; no spine or promotion claim follows from this document.
