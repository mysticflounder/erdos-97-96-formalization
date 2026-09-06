# Math Skeptic Audit: TwoInteriorSameBoundaryRadius.lean

**Target**: `lean/Erdos9796Proof/Geometry/TwoInteriorSameBoundaryRadius.lean`
**Date**: 2026-09-05
**Verdict**: SOURCE-CLEAN / BUILT; CONSUMER PROMOTION PENDING
**Claims audited**: 7

## Summary

All seven non-trivial mathematical declarations are Lean-formalized.  The
focused governed build completed all 8011 jobs, the target contains no `sorry`,
custom `axiom`, `native_decide`, `unsafe`, `implemented_by`, or `extern`, and
the two new public conclusions report only `propext`, `Classical.choice`, and
`Quot.sound`.  The new claim is scoped to a center-supported enclosing disk;
it does not identify an arbitrary disk as a minimum enclosing circle and does
not claim any exact-thirteen incidence or closure consequence.  This audit
certifies the geometry module at its focused build snapshot only: it does not
establish consumer reachability or project-level promotion while the
proof-blueprint index/call graph remains stale.

## Findings

### F1: Coordinate inner-product identity

- **Location**: `lean/Erdos9796Proof/Geometry/TwoInteriorSameBoundaryRadius.lean:27`
- **Quote**: “The real inner product in the Euclidean plane is the sum of the two coordinatewise products.”
- **Stated label**: Implicitly proven.
- **Evidence present**: Lean theorem `oneBoundary_inner_eq_coords`, proved by expansion of `PiLp.inner_apply`.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The declaration compiled and is used inside the checked separation-to-coordinate bridge.

### F2: Strict finite-hull separation

- **Location**: `lean/Erdos9796Proof/Geometry/TwoInteriorSameBoundaryRadius.lean:34`
- **Quote**: “A point outside the convex hull of a finite planar set admits a vector which points strictly from every hull point toward the excluded point.”
- **Stated label**: Implicitly proven.
- **Evidence present**: Lean theorem `exists_strict_separating_vector_from_finite_convexHull`, using compact convex-hull separation and the real inner-product dual equivalence.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The theorem is a direct checked specialization of geometric Hahn–Banach separation.

### F3: Normalized scalar contradiction

- **Location**: `lean/Erdos9796Proof/Geometry/TwoInteriorSameBoundaryRadius.lean:64`
- **Quote**: “The scalar contradiction behind the one-boundary reflected-pair theorem.”
- **Stated label**: Implicitly proven.
- **Evidence present**: Lean theorem `false_of_normalized_one_boundary_reflected_pair`; its polynomial identity and all sign obligations are kernel-checked.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The hypotheses explicitly include the reflected coordinates, radius lower bound, disk inequalities, and all strict separator inequalities.

### F4: Strict interiority of the second endpoint

- **Location**: `lean/Erdos9796Proof/Geometry/TwoInteriorSameBoundaryRadius.lean:103`
- **Quote**: “In the normalized frame, a nontrivial reflected pair lying in the disk through `(-1, 0)` forces `(1, 0)` to lie strictly inside that disk.”
- **Stated label**: Implicitly proven.
- **Evidence present**: Lean theorem `normalized_second_endpoint_strictly_inside`.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The conclusion follows from the two displayed disk inequalities, positive longitudinal displacement, and the competing-radius lower bound.

### F5: One-boundary strict radius drop

- **Location**: `lean/Erdos9796Proof/Geometry/TwoInteriorSameBoundaryRadius.lean:124`
- **Quote**: “Two distinct common equidistant points force their radius about `B` to be strictly smaller than `BP` when `P` is on a genuinely center-supported enclosing circle.”
- **Stated label**: Implicitly proven.
- **Evidence present**: Lean theorem `dist_lt_base_of_one_boundary_reflected_pair`; focused build exit 0; in-module `#print axioms` at line 387.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The theorem retains finite-set membership, convex independence, disk containment, the exact boundary equality for `P`, and center membership in the convex hull of boundary carriers.  Its axiom report is `[propext, Classical.choice, Quot.sound]`.

### F6: Equality-case uniqueness

- **Location**: `lean/Erdos9796Proof/Geometry/TwoInteriorSameBoundaryRadius.lean:358`
- **Quote**: “Equality in the one-boundary radius comparison is impossible.”
- **Stated label**: Implicitly proven.
- **Evidence present**: Lean theorem `eq_of_one_boundary_same_radius_pair`, derived from the strict radius theorem; focused build exit 0; in-module `#print axioms` at line 388.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The corollary derives `P ≠ B` from the equality hypotheses when the candidate points are distinct, applies the strict theorem, and closes the incompatible equality.  Its axiom report is `[propext, Classical.choice, Quot.sound]`.

### F7: Existing two-boundary obstruction

- **Location**: `lean/Erdos9796Proof/Geometry/TwoInteriorSameBoundaryRadius.lean:393`
- **Quote**: “Two distinct disk points cannot have the same distance pattern to two points on a common disk boundary when their two endpoint distances are also equal.”
- **Stated label**: Implicitly proven.
- **Evidence present**: Lean theorem `false_of_two_interior_same_boundary_radius`, with a complete coordinate proof in the target file; the same focused module build completed successfully.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The declaration contains no placeholder or external computational evidence and uses only checked metric-coordinate algebra.

## Weasel words

None found in the mathematical claim text.

## Scope conflation

None.  In particular, the strict theorem assumes the center-support premise
directly and does not claim that disk containment alone supplies it.  The file
contains no statement about exact-thirteen source incidence or all-cell
coverage.

## Lean sorry graph

The target contains no `sorry`.  The new public strict theorem and its equality
corollary both report exactly `[propext, Classical.choice, Quot.sound]`; hence
their transitive proof closures contain no `sorryAx` or project custom axiom.

## Upgrade drift

The stronger strict-radius label is accompanied by a new Lean theorem and a
new checked equality corollary in the same diff.  No finite computation is
used to support the general claim.

## Promotion status

The geometry source is clean, its focused governed build succeeded, and the
two public declarations have only the project-approved core axiom closure.
Consumer reachability and project-level promotion remain pending a fresh,
successful proof-blueprint reference mine over a matching current build.
