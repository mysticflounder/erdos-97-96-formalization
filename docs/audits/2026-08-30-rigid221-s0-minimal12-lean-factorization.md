# Rigid221 S0 minimal12 Lean factorization

This checkpoint follows the source-level common-core extraction recorded in
`2026-08-30-rigid221-s0-common-core-theorem-extraction.md` and records only
the bounded Lean landing and its independent verification.

## Lean factorization checkpoint

The formalization is split into an invariant metric kernel and a normalized
five-point adapter.

The source-independent kernel is

```text
Erdos9796Proof.Geometry.false_of_equalRadius_detCone
```

in `lean/Erdos9796Proof/Geometry/EqualRadiusDeterminantCone.lean`.  It consumes
only equal squared radii, a negative first turn, a nonpositive cap turn, a
radial supporting inequality, and a positive second turn.  Its proof uses the
public division-free identity

```text
Erdos9796Proof.Geometry.signedArea2_detCone_identity
```

and the equal-radius projection bound

```text
Erdos9796Proof.Geometry.distSq_sub_inner_nonneg_of_equal_distSq.
```

The fixed-coordinate adapter is

```text
Erdos9796Proof.Geometry.normalizedFivePoint_orientation_incompatibility
```

in `lean/Erdos9796Proof/Geometry/NormalizedFivePointOrientation.lean`.  Its
twelve hypotheses preserve the retained assertion occurrences one for one:

| Source assertion | Lean hypothesis | Mathematical content |
|---:|---|---|
| 0 | `hOx` | `O_x = 0` |
| 3 | `hm1y` | `m1_y = -4/5` |
| 4 | `hm2x` | `m2_x = 8/5` |
| 5 | `hm2y` | `m2_y = 4/5` |
| 115 | `hdeltaRadius` | squared `O`-radius of `delta` is `radiusSq` |
| 118 | `hvRadius` | squared `O`-radius of `v` is `radiusSq` |
| 148 | `hvDisk` | `v` lies in the closed unit disk centered at `(1,0)` |
| 156 | `hm1Boundary` | `m1` lies on that unit circle |
| 158 | `hOBoundary` | `O` lies on that unit circle |
| 198 | `hdeltaVO` | `signedArea2 v delta O > 0` |
| 213 | `hm1DeltaV` | `signedArea2 delta m1 v > 0` |
| 349 | `hcapProduct` | the two indicated signed areas have nonpositive product |

The adapter derives the five invariant kernel hypotheses and applies the
kernel; it does not repeat the determinant-cone proof.  Focused `lake-build`
of `Erdos9796Proof.Geometry.NormalizedFivePointOrientation` passes under
`leanprover/lean4:v4.27.0` and mathlib `v4.27.0` with the default heartbeat
budget and no warnings in either new module.

The intended next wrappers belong in
`Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress`.  The named
eventual on-spine consumer is
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`.
The first missing producer is a source-faithful normalization theorem that
constructs `O = (0,0)`, the MEC center `(1,0)`, the two displayed Moser
coordinates, and transports all distance and signed-area facts.  Until that
producer and the fixed-cell dispatcher are proved, the normalized theorem is
a bounded reusable API and does not reduce the `minimalCore` proof spine.

The in-project theorem-bank preflight at base revision
`c5b7259dced01866935a38de2c1e2994e5786ee8` found the closest cap metric and
coordinate APIs but no declaration consuming these twelve hypotheses.
`Problem97.ExactA2CapMetric.false_of_clearance_and_outside_hit` first lacks
the required clearance and global-order producers, while
`Problem97.BpD_mul_normSq_eq` does not supply the retained orientation-product
sign.  Neither candidate is used by this proof.

## Independent Lean verification

An independent read-only review by lane
`rigid221_minimal12_lean_verifier`, against base revision
`c5b7259dced01866935a38de2c1e2994e5786ee8`, classified the result as an
**independently verified bounded candidate**, not a promoted spine theorem.
The reviewer compared the adapter to the solver packet, independently checked
the determinant and cyclic-orientation identities in Lean, and confirmed the
exact retained source-index list
`[0, 3, 4, 5, 115, 118, 148, 156, 158, 198, 213, 349]`.

The focused command

```text
LAKE_BUILD_NO_REFRESH=1 lake-build Erdos9796Proof.Geometry.NormalizedFivePointOrientation
```

completed successfully with 2369 jobs and no warning in either new module.
Literal `#print axioms` checks and `proof-blueprint axioms` both reported
exactly `propext`, `Classical.choice`, and `Quot.sound` for the kernel and the
adapter.  The review found no `sorry`, `admit`, custom axiom, native reduction,
unsafe or partial definition, external implementation, or external-evidence
dependency.  `proof-blueprint intent diff` was clean, and the off-spine
registrations accurately describe the kernel as infrastructure and the
adapter as a diagnostic theorem.

The review also confirmed that the publication spine remains at 25 open
obligations and neither new declaration is on it.  The source-faithful
normalization and dispatcher ingress to
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`
remain the first unresolved integration step.
