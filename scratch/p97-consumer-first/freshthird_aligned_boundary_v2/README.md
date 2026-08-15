# FreshThird aligned mutual-boundary packet, exact-17 diagnostic v2

This sibling scratch query copies v1 and adds the source-proved exact 2x2
adjacent-cap grid for the two retained first-apex radii. It is finite
incidence/cap bookkeeping only: not a Euclidean realization, not a universal
cardinality lift, and not Lean proof closure.

## Preserved ingress

The v1 exact-17 ingress and four malformed controls are unchanged: carrier
size 17; closed-cap profile `(8,6,6)` and strict profile `(6,4,4)`; global
K4/blocker-fiber/shell constraints; unequal radii, singleton slices, retained
multi-point proposition; exact four-point source rows; deletion-core/common
omission; distinct strict blocker caps; zero/apex positions; Direct/Mirror
blocks; and cyclic separation. See v1's README and
`freshthird_aligned_boundary_v2.py` for the literal adapter.

## New source projection

For first apex `oppIndex1`, adjacent closed caps are cap 1
(`oppIndex2`) and cap 2 (`surplus`). For each retained radius `r=0,1`, the
finite class `radius_points[r]` has cardinality four and exactly one selected
point in each adjacent closed cap. The two hits on each side are explicitly
disjoint, and each side has at least one hit in its strict adjacent interior.
This projects the source shape
`MoserSelectorShapeAt` and
`IsM44.exists_nonSurplusMoserSelectorShapes` in
`lean/Erdos9796Proof/P97/SurplusM44Packet/Shard02.lean:916-933` and
`Shard05.lean:208-223`, together with the strict-adjacent conversion used by
`PinnedSurplusProducer.lean:2079-2092,2277-2290`.

## Results

The script runs the four malformed smoke controls first, then positive Z3
Direct/Mirror cases, serially (well below the four-core cap). Z3 positives
are independently checked by the Python validator for permutation/order,
all prior ingress clauses, exact grid cardinalities, hit disjointness, and
strict-adjacent witnesses. cvc5 is retained only as a secondary status.

The SAT model leaves both live arms satisfiable. The smallest surviving motif
is the four-hit `2 radii x 2 adjacent sides` grid, with one hit per cell and
at least one strict hit per side; the concrete Direct/Mirror witnesses are in
`results.txt` and `positive_direct.smt2` / `positive_mirror.smt2`.

No result here closes a Euclidean or universal claim.
